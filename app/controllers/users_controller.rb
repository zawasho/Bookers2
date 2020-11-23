class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:edit,:update,]}

  def new
    @book = Book.new
  end
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
    @books = Book.all
  end
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  def new
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(current_user.id)
    else
      render "/users/_sign_up"
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
  	@user.update(user_params)
  	if @user.save
  		redirect_to user_path(@user.id)
      flash[:notice] = "Profile was successfully updated."
  	else
  		render :edit
  	end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  def user_params
    params.require(:user).permit(:name,:image,:introduction)
  end
  def ensure_correct_user
     @user = User.find(params[:id])
     if @user.id != current_user.id
     redirect_to user_path(current_user.id)
     end
  end
end


