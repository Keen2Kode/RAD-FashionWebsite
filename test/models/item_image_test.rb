require 'test_helper'

class ItemImageTest < ActiveSupport::TestCase
  
  def setup
    @item_image = item_images(:one)
  end
  
  test "should be valid" do
    assert @item_image.valid?
  end
  
  test "image link should not be nil" do
    @item_image.image_link = nil
    assert_not @item_image.valid?
  end
  
  test "image link should be present" do
    @item_image.image_link = " "
    assert_not @item_image.valid?
  end
  
  
  
  
  test "images with the same link and item should not be valid" do
    clone = @item_image.dup
    @item_image.save
    assert_not clone.valid?
  end
  
  test "images with the same link but different items should be valid" do
    clone = @item_image.dup
    @item_image.item = items(:one)
    clone.item = items(:two)
    
    assert clone.valid?
    assert @item_image.valid?
  end
  
end
