require 'capybara/rspec'
require 'capybara-webkit'
require 'capybara/webkit/matchers'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'mock5'

ENV["RAILS_ENV"] ||= 'test'

Capybara.javascript_driver = :webkit
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include(Capybara::Webkit::RspecMatchers, :type => :feature)
  config.include(Rails.application.routes.url_helpers)
end
