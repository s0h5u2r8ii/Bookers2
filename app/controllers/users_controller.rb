class UsersController < ApplicationController

before_action :authenticate_user!

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new
	end

	def show
		@book = Book.new
		@books = Book.all
		@users = User.find(params[:id])
		@post = @users.books
	end

	def index
		@user = User.all
		@book = Book.new
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		   flash[:notice] = "successfully updated."
			redirect_to user_path(@user.id)
	    else
		    render :edit
		end
    end

	private
    def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
    end

end