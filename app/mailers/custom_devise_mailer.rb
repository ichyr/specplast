class CustomDeviseMailer < Devise::Mailer
  title = I18n.t("layout.title")
  default from: "'#{title}' #{Rails.application.secrets.email_provider_username}"

  puts "DEVISE mailer"
  puts
  puts title
  puts
  puts "'#{title}' #{Rails.application.secrets.email_provider_username}"
  puts
  puts "DEVISE mailer"
end