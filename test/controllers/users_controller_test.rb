require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:one)
    @user_2 = users(:two)
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
    assert_not is_logged_in?
    
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

end
