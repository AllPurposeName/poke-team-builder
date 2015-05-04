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

  config.include Rails.application.routes.url_helpers

  omniauth_hash = { 'provider' => 'twitter',
    'uid' => '9001',
    'info' => {
    'name' => 'DJ',
  } }

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(omniauth_hash)
  OmniAuth.config.on_failure = Proc.new { |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
  }
  OmniAuth.config.add_mock(:twitter, omniauth_hash)

  def login_user
    ApplicationController.any_instance.mocha.stubs(:current_user).with(User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:twitter]))
  end
end
