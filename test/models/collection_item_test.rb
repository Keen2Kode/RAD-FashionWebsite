require 'test_helper'

class CollectionItemTest < ActiveSupport::TestCase
  def setup
    @collection_item = collection_items(:one)
  end
  
  test "collection should be present" do
    @collection_item.category = nil
    assert_not @collection_item.valid?, @collection_item.errors.full_messages.to_sentence
  end
  
  test "item should be present" do
    @collection_item.item = nil
    assert_not @collection_item.valid?, @collection_item.errors.full_messages.to_sentence
  end
  
  
  
  
  
  
  
  test "should have exactly 3 category choices" do
    assert_equal 3, CollectionItem.categories.size, "populate the category enum with 3 categories: men, women, kids"
  end
  
  test "should have 'men' category" do
    assert_includes CollectionItem.categories.keys, 'men'
  end
  
  test "should have 'women' category" do
    assert_includes CollectionItem.categories.keys, 'women'
  end

  test "should have 'kids' category" do
    assert_includes CollectionItem.categories.keys, 'kids'
  end
  
  test "collections array should have 'new_ins'" do
    assert_includes CollectionItem.collections, CollectionItem.new_ins
  end
  
  
  
  
  
  
  test "non-existent category value should raise error" do
    assert_raise(ArgumentError) do
      @collection_item.category = CollectionItem.categories.size + 1
    end
  end
  
    
  test "non-existent category key should raise error" do
    assert_raise(ArgumentError) do
      @collection_item.category = "Non existent category key"
    end
  end






  test "same category and items should not be valid" do
    assert_not @collection_item.dup.valid?
  end
  
  test "same category but different items should be valid" do
    clone = @collection_item.dup
    @collection_item.item = items(:one)
    clone.item = items(:two)
    
    @collection_item.save
    assert clone.valid?
  end
  
  test "same item can have multiple collections" do
    clone = @collection_item.dup
    @collection_item.category = 1
    clone.category = 2
    
    @collection_item.save
    assert clone.valid?
  end
  
end
