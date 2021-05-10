require 'test_helper'

class BagItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bag_items_index_url
    assert_response :success
  end

end
