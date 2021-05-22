require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get popular" do
    get popular_url
    assert_response :success
  end
  
  test "should post newsletter" do
    post newsletter_url @item, params:
    {
      visitor:
      {
        email: "RaD2021@gMail.com"
      }
    }
    assert_response :success
  end
  
  
  
  
  
  

  test "should get search without query" do 
    get search_url params:
    {
      query: ""
    }
    assert_response :success
  end

  test "should get search with query" do 
    get search_url params:
    {
      query: "searching for items"
    }
    assert_response :success
  end
    
  
  
  
  
  
  
  test "subscribing with a valid email should add visitor to newsletter" do
    assert_difference "Visitor.count", 1 do
      post newsletter_url @item, params:
      {
        visitor:
        {
          email: "RaD2021@gMail.com"
        }
      }
    end
  end
  
  test "subscribing with a invalid email should add visitor to newsletter" do
    assert_no_difference "Visitor.count" do
      post newsletter_url @item, params:
      {
        visitor:
        {
          email: "invalid email"
        }
      }
    end
  end
end
