class WelcomeMailer < ApplicationMailer
	default from: 'usertesting743@gmail.com'

	def welcome_send(user)
		@user = user
		mail to: @user.email, subject: "Welcome to Stock Portfolio", from: 'usertesting743@gmail.com'
	end

end
