ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'database_cleaner'
require 'pry'

# module TestHelpers
#
#   include Rack::Test::Methods
#
#   def setup
#     DatabaseCleaner.start
#   end
#
# end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end


class ActionDispatch::IntegrationTest
  include Capybara::DSL
  # include TestHelpers

  def teardown
    reset_session!
    # DatabaseCleaner.clean
    # super
  end

  def login_user!
    user = User.create(username: "matt", password: "password")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome, matt")
  end
end
