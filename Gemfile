# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'
gem 'bootsnap', require: false
gem 'pg', '~> 1.5.3'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.5'
gem 'rubocop', require: false
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'shoulda-matchers'
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'dotenv-rails'
  gem 'faker'
end

group :test do
  gem 'simplecov', require: false
end
