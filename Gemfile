# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise', '>= 4.7.1'
# for configuring environmental variables
gem 'figaro'
# add security extension for password complexity
gem 'devise_security_extension', git: 'https://github.com/phatworx/devise_security_extension.git'
gem 'rails_email_validator'
# These gems currently held back for potential compatibility issues - haven't verified that the latest versions work yet
gem 'doorkeeper', '~> 4.4'
gem 'fhir_client', '~> 3.0.5'
gem 'fhir_models', '~> 3.0.3'
gem 'rack-cors', require: 'rack/cors'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'
gem 'jwt'
gem 'uuid'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', '~> 0.69.0', require: false
end

group :test do
  gem 'action-cable-testing' # note - expected to be merged into rails in v6.0
  gem 'brakeman', require: false
  gem 'bundler-audit'
  gem 'fakeweb'
  gem 'minitest'
  gem 'minitest-emoji'
  gem 'rerun'
end
group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
