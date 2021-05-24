require 'test_helper'

class BagItemTest < ActiveSupport::TestCase

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
    
    @item = @bag_item.item
    
  end
  
  
  
  
  test "quantity should be present" do
    @bag_item.quantity = nil
    assert_not @bag_item.valid?
  end
  
  test "user should be present" do
    @bag_item.user = nil
    assert_not @bag_item.valid?
  end
  
  test "variant should be present" do
    @bag_item = BagItem.new(user: @user, quantity: 10)
    assert_not @bag_item.valid?
  end
  
  
  
  
  
  
  
  test "quantity should be greater than 0" do
    @bag_item.quantity = 1
    assert @bag_item.valid?
  end
  
  test "quantity should not be 0 or less" do
    @bag_item.quantity = 0
    assert_not @bag_item.valid?
  end
  
  
  
  
  

  
    
  test "duplicate bag items should be valid" do
    assert @bag_item.dup.valid?
  end
  
  test "should update quantity if same variant and bag" do
    clone = @bag_item.dup
    clone.quantity = 204

    clone.save
    assert_equal @bag_item.quantity + clone.quantity, @bag_item.reload.quantity, 
    "clone should add to old bag item quantity, not create new bag item"
  end

end
