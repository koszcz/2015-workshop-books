class CommentsController < ApplicationController
  def create
  	book = Book.find(params[:book_id])
  	book.comments.create(permitted_params)
  	redirect_to book
  end

  def permitted_params
  	params.require(:comment).permit(:content)
  end
end
