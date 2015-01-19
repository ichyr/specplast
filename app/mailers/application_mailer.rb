class ApplicationMailer < ActionMailer::Base
	title = I18n.t("layout.title")
  default from: "#{Rails.application.secrets.email_provider_username}"
  layout 'mailer'
end
