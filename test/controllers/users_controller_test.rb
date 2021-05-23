require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include SavedHelper
  def setup
    @user = users(:bill)
    @user_2 = users(:mary)
    @user_password = 'billisAWesome'
    @user_2_password = 'maryIsAwsoem'
  end
 
  test "should redirect edit when logged in as wrong person" do
    # the password is a decrypted version
    log_in_as @user_2, @user_2_password
    get edit_user_path @user
    assert_redirected_to user_path @user_2
  end

  # here we redirect to the PROMPT page, not the root
  test "should redirect show when not logged in" do
    get user_path @user
    assert_redirected_to prompt_url
  end  
  
  
  
  
  
  
  test "should get signup" do
    get signup_url
    assert_response :success
  end

  test "should get login" do
    get login_url
    assert_response :success
  end

  test "should get prompt" do
    get prompt_url
    assert_response :success
  end
  
  test "should show user" do
    log_in_as @user, @user_password

    get user_url(@user)
    assert_response :success
  end
  
  
  
  
  
  
  
  test "valid signup" do
    get signup_path
    
    assert_difference 'User.count', 1 do
      post signup_path, 
      params: 
      { 
        user: 
        { 
          name: "mynameisRAD",
          email: "test123@test.com",
          password: "password",
          password_confirmation: "password" 
        } 
      }
    end
    
    assert is_logged_in?
  end






  # feature multiple browsers
  test "logging in adds saved list cookies to database" do
    cookies_add_saved(items(:one).id)
    cookies_add_saved(items(:two).id)
    
    assert_difference 'SavedItem.count', 2 do
      log_in_as @user, @user_password
    end
  end
  
  test "logging out syncs the saved list cookies with the database" do
    log_in_as @user, @user_password
    SavedItem.create(user: @user, item: items(:one))
    SavedItem.create(user: @user, item: items(:two))
    
    assert_difference 'cookies_saved.size', 2 do
      delete logout_url
    end
  end
end
