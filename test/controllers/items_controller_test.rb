require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @item = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end
  
  test "should get edit" do
    get edit_item_url @item
    assert_response :success
  end
  
  
  
  
  

  test "should create item" do
    assert_difference 'Item.count' do
      post items_url, params: 
      { 
        item: 
        { 
          # @item already saved to db by fixture, so needs a unique name
          arrival_date: @item.arrival_date,
          description: @item.description, 
          image_link: @item.image_link, 
          name: "Different item name", 
          price: @item.price
        } 
      }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should update item" do
    patch item_url(@item), params: 
    { 
      item: 
      { 
        arrival_date: Date.new(2020,10,10),
        description: "New description", 
        image_link: "link", 
        name: "blah", 
        price: 10.5
      } 
    }
    assert_redirected_to item_url(@item)
  end
end
