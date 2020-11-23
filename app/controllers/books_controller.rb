class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:edit,:update,:destroy]}

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end
  def create
    @user = current_user
    @book = @user.books.new(book_params)
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash[:notice] = ' errors prohibited this obj from being saved:'
      render "index"
    end
  end
  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
  @book = Book.find_by(id: params[:id])
  if @book.update(book_params)
  flash[:notice] = "You have creatad book successfully."
  redirect_to  book_path(@book.id)
  else
  render "edit"
  end
  end
  def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

  def  ensure_correct_user
    @book = Book.find(params[:id])
     if @book.user_id != current_user.id
        redirect_to books_path
     end
  end
end
