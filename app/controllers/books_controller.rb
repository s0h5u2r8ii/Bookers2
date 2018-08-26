class BooksController < ApplicationController
  def top
  end

  def index
  	  @book = Book.new
  	  @books = Book.all
  end

  def about

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(current_user)
  end

  def show
  end

  def edit
  end

  private

  def book_params
      params.require(:book).permit(:title, :opinion)
  end

end
