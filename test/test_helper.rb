ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha/mini_test'
require 'database_cleaner'

DatabaseCleaner[:active_record].strategy = :truncation, {except: %w[public.schema_migrations]}

class ActiveSupport::TestCase
  include Capybara::DSL
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    reset_session!
    DatabaseCleaner.start
    super
  end

  def teardown
    reset_session!
    DatabaseCleaner.clean
    super
  end
end
