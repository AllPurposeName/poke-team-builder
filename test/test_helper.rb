require 'simplecov'
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha'
require 'mocha/mini_test'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  OmniAuth.config.test_mode = true
  omniauth_hash = { 'provider' => 'twitter',
    'uid' => '9001',
    'info' => {
    'name' => 'DJ',
  } }

  OmniAuth.config.add_mock(:twitter, omniauth_hash)

  def login_user
    ApplicationController.any_instance.mocha.stubs(:current_user).with(CurrentUser.new(User.create_from_omniauth(OmniAuth.config.mock_auth[:twitter])))
  end
end
