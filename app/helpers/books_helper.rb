module BooksHelper
  def like_for_object(object, url)
  	form_for(object.likes.new, url: url) do |form|
  	  concat form.submit("Like")
  	end
  end

  def like_for_book(book)
  	like_for_object(book, book_likes_path(book))
  end

  def unlike_for_book(book, user)
  	path = book_like_path(book, book.like_for_user(user))
  	link_to "Unlike", path, method: :delete
  end

  def like_for_comment(comment)
  	url = book_comment_likes_path(comment.book, comment)
  	like_for_object(comment, url)
  end

  def unlike_for_comment(comment, user)
  	like = comment.like_for_user(user)
  	path = book_comment_like_path(comment.book, comment, like)
  	link_to "Unlike", path, method: :delete
  end
end
