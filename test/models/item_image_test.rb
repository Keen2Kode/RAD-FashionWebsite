require 'test_helper'

class ItemImageTest < ActiveSupport::TestCase
  
  def setup
    @item_image = item_images(:one)
  end
  
  test "should be valid" do
    assert @item_image.valid?
  end
  
  test "item image should not be nil" do
    @item_image.image_link = nil
    assert_not @item_image.valid?
  end
  
  test "image should be present" do
    @item_image.image_link = " "
    assert_not @item_image.valid?
  end
  
  test "image should allow duplicates" do
    assert @item_image.dup.valid?
  end
end
