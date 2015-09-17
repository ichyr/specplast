# config/initializers/secret_token.rb

# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# Rails.application.config.secret_token = ENV['SPECPLAST_PRODUCTION_SECRET_TOKEN'] || SecureRandom.hex(64)
# Rails.application.config.secret_key_base = Rails.application.secrets.secret_key_base || SecureRandom.hex(64)

Specplast::Application.config.secret_token = Rails.application.secrets.secret_token || SecureRandom.hex(64)
Specplast::Application.config.secret_key_base = Rails.application.secrets.secret_key_base || SecureRandom.hex(64)