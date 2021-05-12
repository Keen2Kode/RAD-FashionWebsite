require 'test_helper'

class SavedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get saved_index_url
    assert_response :success
  end

end
