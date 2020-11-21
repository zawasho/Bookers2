class BooksController < ApplicationController
  def show
    @user = current_user
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def create
    @user = current_user
		@book = Book.new
	if @book.save
	  redirect_to  book_path(@book.id)
	else
    @books = Book.all
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
  @book = Book.find(params[:id])
  if @book.update(book_params)
  flash[:notice] = "You have creatad book successfully."
  redirect_to  book_path(@book.id)
  else
  @books = Book.all
  flash[:notice]= ' errors prohibited this obj from being saved:'
  render "edit"
  end
  end
end
