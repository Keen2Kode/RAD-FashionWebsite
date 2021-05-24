require 'test_helper'

class BagItemsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @bag_item = bag_items(:one)
    @bag_params = 
    {
      bag_item: 
      {
        colour: @bag_item.item_variant.colour,
        size: @bag_item.item_variant.size,
        quantity: @bag_item.quantity,
        item_id: @bag_item.item.id
      }
    }
    
    @user = @bag_item.user
    @user_password = 'billisAWesome'
    
  end
  
  test "should get index if logged in" do
    log_in_as @user, @user_password
    get bag_items_url
    assert_response :success
  end  
  
  
  
  
  
  
  
  test "should refresh create if logged in" do
    log_in_as @user, @user_password
    post bag_items_url, params: @bag_params
    assert_redirected_to bag_items_url
  end  
  
  test "should refresh destroy if logged in" do
    log_in_as @user, @user_password
    @bag_item.save
    delete bag_item_url(@bag_item.id)
    assert_redirected_to bag_items_url
  end
  
  test "should redirect create if logged out" do
    post bag_items_url, params: @bag_params
    assert_redirected_to prompt_url
  end    

  test "should redirect index if logged out" do
    get bag_items_url
    assert_redirected_to prompt_url
  end  







  test "bag item should be persisted in session if logged out" do 
    post bag_items_url, params: @bag_params
    # previously the session was nil
    # basically calling an "assert difference" on session
    assert session[:bag_item]
  end
  
  test "created bag item should be dropped from session" do 
    log_in_as @user, @user_password
    post bag_items_url, params: @bag_params
    assert_not session[:bag_item]
  end
  
  test "should create bag item if logged in" do
    log_in_as @user, @user_password
    # empty database so bag item can be created again
    BagItem.destroy_all
    
    assert_difference "BagItem.count", 1 do
      post bag_items_url, params: @bag_params
    end
    
  end
  
  
  
  
  

  
  
  
  
  
  test "should checkout user's bag items if logged in" do
    log_in_as @user, @user_password
    
    assert_no_difference "BagItem.count" do
      post checkout_bag_items_url, xhr: true
    end
  end  
end
