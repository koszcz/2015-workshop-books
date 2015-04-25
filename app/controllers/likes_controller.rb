class LikesController < ApplicationController
  def create
  	context.likes << Like.new(user: current_user)
  	redirect_for_context
  end

  def destroy
  	Like.destroy(params[:id])
  	redirect_for_context
  end

  def redirect_for_context
  	if context.is_a? Book
  	  redirect_to context 
  	else
  	  redirect_to context.book
  	end
  end

  def context
  	if params[:comment_id]
  	  Comment.find(params[:comment_id])
  	else
  	  Book.find(params[:book_id])
	  end
  end
end
