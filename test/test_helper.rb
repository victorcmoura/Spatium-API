<<<<<<< HEAD
require File.expand_path('../../config/environment', __FILE__)
=======
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
>>>>>>> New project created with Rails 5.2
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
