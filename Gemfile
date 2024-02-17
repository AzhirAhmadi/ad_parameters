# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.3'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.8'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

gem 'rexml', '~> 3.2', '>= 3.2.5'

gem 'protobuf'

gem 'google-protobuf'

# Dry-rb gems
gem 'dry-initializer', '~> 3.1.0', '>= 3.1.1'
gem 'dry-monads', '~> 1.5'
gem 'dry-types', '~> 1.5', '>= 1.5.1'

group :development, :test do
  gem 'pry', '~> 0.14', '>= 0.14.1'

  gem 'factory_bot_rails', '~> 6.2', '>= 6.2.0', require: false
  gem 'faker'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'rswag-specs'
  gem 'shoulda-matchers', '~> 5.2', require: false

  gem 'by'

  gem 'rubocop', '~> 1.50.1'
  gem 'rubocop-performance', '~> 1.15'
  gem 'rubocop-rails', '~> 2.16', '>= 2.16.1'
  gem 'rubocop-rspec', '~> 2.13', '>= 2.13.2'
end
