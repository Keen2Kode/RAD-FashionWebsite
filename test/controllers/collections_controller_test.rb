require 'test_helper'

class CollectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get collections_index_url
    assert_response :success
  end

  test "should get men" do
    get collections_men_url
    assert_response :success
  end

  test "should get women" do
    get collections_women_url
    assert_response :success
  end

  test "should get kids" do
    get collections_kids_url
    assert_response :success
  end

  test "should get new_ins" do
    get collections_new_ins_url
    assert_response :success
  end

end
