ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def log_in_as(user, password)
    post login_path, 
    params: 
    { 
      user: 
      { 
        email: user.email, 
        password: password
      } 
    }
  end
  
  def is_logged_in?
    # only becomes available after a user logs in and activates the session
    !session[:user_id].nil?
  end
  # Add more helper methods to be used by all tests here...
end
