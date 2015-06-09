class UsersMailer < ApplicationMailer

	default from: "info@blog.localhost",
	        template_path: 'mailers/users'

	def activate user
	  @user = user
	  mail to: user.email,
           subject: "Blog account activation"
	end
end
