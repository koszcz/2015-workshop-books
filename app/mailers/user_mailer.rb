class UserMailer < ApplicationMailer

	def confirmation_email(user, book)
		@user = user
		@book = book
		mail(to: @user.email, subject: "You've added new book")
	end

end
