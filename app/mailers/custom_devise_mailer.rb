class CustomDeviseMailer < Devise::Mailer
  title = I18n.t("layout.title")
  default from: "'#{title}' #{Rails.application.secrets.email_provider_username}"
end