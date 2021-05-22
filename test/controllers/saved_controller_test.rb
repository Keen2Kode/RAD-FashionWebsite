require 'test_helper'

class SavedControllerTest < ActionDispatch::IntegrationTest
  include SavedHelper
  
  def setup
    @user = users(:one)
    @user_password = 'billisAWesome'
    
    @item = items(:one)
  end

  test "should get index" do
    get saved_index_url
    assert_response :success
  end

  test "should get db" do
    get db_saved_index_url
    assert_response :success
  end
  
  
  
  
  
  
  
  test "adds items to saved list database when logged in" do
    log_in_as @user, @user_password
    
    assert_difference 'SavedItem.count', 1 do
      # put makes rails expect to redirect/render a template, xhr avoids throwing an error for that
      put saved_url(@item), xhr: true
    end
  end
  
  test "deletes items from saved list database when logged in" do
    log_in_as @user, @user_password
    SavedItem.create(user: @user, item: @item)
    
    assert_difference 'SavedItem.count', -1 do
      put saved_url(@item), xhr: true
    end
  end
  
  test "adds items to saved list cookies when logged out" do 
    # can't mock cookies_saved so we include the Saved Helper
    assert_difference 'cookies_saved.size', 1 do
      put saved_url(@item), xhr: true
    end
  end  
  
  test "deletes items from saved list cookies when logged out" do
    cookies_add_saved(@item.id)
    
    assert_difference 'cookies_saved.size', -1 do
      put saved_url(@item), xhr: true
    end
  end


end
