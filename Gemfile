# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'
gem 'active_model_serializers'
gem 'bootsnap', require: false
gem 'pg', '~> 1.5.3'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.5'
gem 'rswag-api'
gem 'rswag-ui'
gem 'rubocop', require: false
gem 'sqlite3'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'database_cleaner'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'pry-remote'
  gem 'rspec-rails'
  gem 'rswag-specs'
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'shoulda-matchers'
end

group :test do
  gem 'simplecov', require: false
end
