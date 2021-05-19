require 'test_helper'

class BagItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bag_items_index_url
    assert_response :success
  end


 # CREATE - choosing a colour/size should be converted into a variant before being passed into bag item
 
 # CREATE - quantity should change if same bag item
 
 # CREATE - same items with different variants show up as different items
end
