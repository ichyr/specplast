class UserMailer < ApplicationMailer
	def new_registration user
		@user = user
    mail(to: user.email, subject: I18n.t("mailer.title.registration"))
	end
end
