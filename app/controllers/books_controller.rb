class BooksController < ApplicationController

before_action :authenticate_user!, only: [:show,:index,:create,:edit,:update,:destroy]

  def top
  end

  def index
  	  @book = Book.new
  	  @books = Book.all
      @user = User.all
  end

  def about
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render :index
    end
  end

  def show
    @book = Book.new
    @books = Book.all
    @bookk = current_user
    @aaa = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path(@book)
  end

  private

  def book_params
      params.require(:book).permit(:title, :opinion, :user_id)
  end

end
