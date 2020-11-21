class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, {only: [:edit,:update,:destroy]}
  def ensure_correct_user
     @user = User.find(params[:id])
     if @user.id != current_user.id
     redirect_to user_path(current_user.id)
     end
  end
  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to '/books/.id'
  end
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end
  def new
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(current_user.id)
    else
      render "/users/_sign_up"
    end
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have creatad book successfully."
    redirect_to  book_path(@book.id)
    else
    @books = Book.all
    flash[:notice]= 'errors prohibited this obj from being saved:'
    render "edit"
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
