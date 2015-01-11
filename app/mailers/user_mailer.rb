class UserMailer < ApplicationMailer

	def new_registration user
		@user = user
    mail(to: user.email, 
    		 subject: "Welcome to Specplast Technologies!!!") do |format|
      format.html { render layout: 'mailer' }
      format.text
    end
	end
end
