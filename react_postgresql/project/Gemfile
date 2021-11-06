# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
gem 'redis', '~> 4.0'
gem 'sass-rails', '>= 6'

gem 'bootsnap', '>= 1.4.4', require: false

# API
gem 'jsonapi-serializer'
gem 'kaminari'
gem 'ransack'

# Front
gem 'react-rails'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails'
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'webmock'
end

group :capistrano do
  gem 'capistrano', '3.9.0'
  gem 'capistrano-docker', git: 'https://github.com/netguru/capistrano-docker.git'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
