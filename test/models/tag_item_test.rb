require 'test_helper'

class TagItemTest < ActiveSupport::TestCase
  def setup
    
    @tag_item = tag_items(:one)
  end
  
  test "should be valid" do
    @tag_item.tag = 1
    assert @tag_item.valid?
  end
  
  test "tag should be present" do
    @tag_item.tag = nil
    assert_not @tag_item.valid?
  end
  
  # so testing calls valid enums
  test "atleast 3 tag choices" do
    assert TagItem.tags.size >= 3, "populate the TagItem.tag enum with 3 tags"
  end
  
  
  
  
  
  
  test "non-existent tag value should raise error" do
    assert_raise(ArgumentError) do
      @tag_item.tag = TagItem.tags.size + 1
    end
  end
  
    
  test "non-existent tag key should raise error" do
    assert_raise(ArgumentError) do
      @tag_item.tag = "Non existing tag key"
    end
  end






  test "tag_items with the same tag and same items should not be valid" do
    clone = @tag_item.dup
    @tag_item.save
    assert_not clone.valid?
  end
  
  test "tag_items with the same tag but different items should be valid" do
    clone = @tag_item.dup
    @tag_item.item = items(:one)
    clone.item = items(:two)
    
    @tag_item.save
    assert clone.valid?
  end
  
  test "tag_items with of the same item can have multiple tags" do
    clone = @tag_item.dup
    @tag_item.tag = 1
    clone.tag = 2
    
    @tag_item.save
    assert clone.valid?
  end
end
