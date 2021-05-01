require 'test_helper'

class CollectionsControllerTest < ActionDispatch::IntegrationTest
  
  test "should get index" do
    get collections_index_url
    assert_response :success
  end

  # test "should get show" do
  #   get collection_url(@name)
  #   assert_response :success
  # end

end
