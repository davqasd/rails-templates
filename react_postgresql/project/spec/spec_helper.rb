# frozen_string_literal: true

# Webmock!
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

ENV['RAILS_ENV'] = 'test'
require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running not in test mode!') unless Rails.env.test?

require 'rspec/rails'
require 'capybara/rails'
require 'factory_bot_rails'

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

require 'database_cleaner/active_record'
require 'faker'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.mock_with :rspec

  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  config.profile_examples = true

  config.filter_rails_from_backtrace!

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  # Clear cache
  config.after(:each) do
    Rails.cache.clear
  end

  config.around(:each) do |example|
    DatabaseCleaner.strategy = example.metadata.fetch(:clean_database_with, :transaction)
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  config.backtrace_inclusion_patterns = [/app|spec/]
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
