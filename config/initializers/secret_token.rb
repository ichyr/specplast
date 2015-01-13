# config/initializers/secret_token.rb

# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Rails.application.config.secret_token = if Rails.env.development? or Rails.env.test?
  ('x' * 30) # meets minimum requirement of 30 chars long
else
  ENV['SPECPLAST_PRODUCTION_SECRET_TOKEN'] || SecureRandom.hex(64)
end

Rails.application.config.secret_key_base = Rails.application.secrets.secret_key_base