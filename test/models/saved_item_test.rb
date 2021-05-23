require 'test_helper'

class SavedItemTest < ActiveSupport::TestCase
  
  def setup
    @saved_item = SavedItem.new(item: items(:one), user: users(:bill))
  end
  
  
  test "user should be present" do
    @saved_item.user = nil
    assert_not @saved_item.valid?
  end
  
  test "item should be present" do
    @saved_item.item = nil
    assert_not @saved_item.valid?
  end
  
  
  
  



  test "saved_items of different items can have the same user" do
    clone = @saved_item.dup
    @saved_item.item = items(:one)
    clone.item = items(:three)
    
    @saved_item.save
    assert clone.valid?, clone.errors.full_messages.to_sentence
  end
  
  test "saved_items with the same item and user should not be valid" do
    clone = @saved_item.dup
    @saved_item.save
    assert_not clone.valid?, "saved_items with same item and user should be invalid"
  end
  
  # can't test deletion, apparently this requires postgresql setting modification
  # https://guides.rubyonrails.org/testing.html#fixtures-in-action
  # so it may not be consistent across environments
end
