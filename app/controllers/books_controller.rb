class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index] 

  def index
  	@books = Book.all
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  	@book = Book.new
  end

  def create
  	book = Book.create(permitted_params)
    UserMailer.confirmation_email(current_user, book).deliver_now
    redirect_to(book, notice: 'Book was successfully added.')
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update permitted_params
  	redirect_to book
  end

  def destroy
  	Book.destroy(params[:id])
  	redirect_to books_path
  end

  def permitted_params
  	params.require(:book).permit(:title, :author, :description)
  end
end
