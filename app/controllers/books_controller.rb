class BooksController < ApplicationController
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
  	redirect_to book
  end

  def permitted_params
  	params.require(:book).permit(:title, :author, :description)
  end
end
