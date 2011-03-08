# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require 'active_model'
require 'action_controller'
require 'action_view'
require 'action_view/template'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

# Rails 3.0.4 is missing this "deprecation" require.
require 'active_support/core_ext/module/deprecation'
require 'action_view/test_case'
require 'mocha'

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_url_options[:host] = "test.com"

Rails.backtrace_cleaner.remove_silencers!

# Configure capybara for integration testing
require "capybara/rails"
Capybara.default_driver   = :rack_test
Capybara.default_selector = :css

# Run any available migration
ActiveRecord::Migrator.migrate File.expand_path("../dummy/db/migrate/", __FILE__)

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

class ActiveSupport::TestCase
  include ActionView::Helpers
end

class ActionView::TestCase
  include MiscHelpers
  include JqmobileHelpers::ActionViewExtensions::FormHelper

  setup :set_controller
  setup :set_response
  setup :setup_new_user

  def set_controller
    @controller = MockController.new
  end

  def set_response
    @response = MockResponse.new(self)
  end

  def setup_new_user(options={})
    @user = User.new({
      :id => 1,
      :name => 'New in jq Form!',
      :description => 'Hello!',
      :created_at => Time.now
    }.merge(options))

    @validating_user = ValidatingUser.new({
      :id => 1,
      :name => 'New in jq Form!',
      :description => 'Hello!',
      :created_at => Time.now,
      :age => 19,
      :company => 1
    }.merge(options))

    @other_validating_user = OtherValidatingUser.new({
      :id => 1,
      :name => 'New in jq Form!',
      :description => 'Hello!',
      :created_at => Time.now,
      :age => 19,
      :company => 1
    }.merge(options))
  end

  def protect_against_forgery?
    false
  end

  def user_path(*args)
    '/users'
  end
  alias :users_path :user_path
  alias :super_user_path :user_path
  alias :validating_user_path :user_path
  alias :other_validating_user_path :user_path
end