class UserMailer < ApplicationMailer
	def new_registration user
		@user = user
    mail(to: user.email, subject: I18n.t("mailer.title.registration")) do |format|
      format.html { render layout: 'mailer' }
      format.text
    end
	end
end
