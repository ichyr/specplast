source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.2.5'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
gem 'bootstrap-sass'
gem 'devise'
gem 'pundit'
gem 'simple_form'
gem 'slim-rails'

gem 'bootstrap3_autocomplete_input'
gem 'twitter-typeahead-rails'

# Application server
gem 'unicorn'
gem 'unicorn-rails'

# file management
gem 'carrierwave', :git => 'https://github.com/carrierwaveuploader/carrierwave.git'
gem 'rmagick', '>= 5.3.0'

# for diagram generation
gem 'railroady'

# pagination gem
gem 'will_paginate', '~> 3.0'

# PostGreSQL DB
gem 'pg'

# Assets
gem 'rails_12factor', group: :production

# Bootstrap 3 WYSIWYG editor with carrierwave file upload
gem 'bootsy'

# Bootstrap pagination links
gem 'will_paginate-bootstrap'

# Gem for token input in instruktors
gem 'jquery-tokeninput-rails'

# Multiple file upload plugin
gem "jquery-fileupload-rails"

gem "que"

# for link_helpers
gem "nested_form"

gem 'jquery-ui-rails'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rails-console'
  gem 'capistrano-rbenv'
  gem 'foreman'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'cucumber-rails', :require=>false
  gem 'shoulda-matchers'

  # for Travis CI
  gem 'rake'
  gem 'spork'
end

gem 'datetimepicker-rails', '>= 3.0.0', :git => 'git://github.com/zpaulovics/datetimepicker-rails.git', :branch => 'tarruda'