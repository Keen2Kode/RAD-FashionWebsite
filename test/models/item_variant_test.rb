require 'test_helper'

class ItemVariantTest < ActiveSupport::TestCase
  def setup
    # has only one variant for ease of modification
    @variant = item_variants(:one)
  end
  
  
  test "size should be present" do
    @variant.size = ""
    assert_not @variant.valid?
  end
  
  test "colour should be present" do
    @variant.size = ""
    assert_not @variant.valid?
  end
  
  
  
  
  
  # so testing calls valid enums
  test "atleast 3 colour choices" do
    assert ItemVariant.sizes.size >= 3, "populate the ItemVariant.size enum with 3 sizes"
  end
  
  test "atleast 3 size choices" do
    assert ItemVariant.colours.size >= 3, "populate the ItemVariant.colour enum with 3 colours"
  end
  
  
  
  
  
  test "non-existent size should raise error" do
    assert_raise(ArgumentError) do
      @variant.size = "Non existing size"
    end
  end
  
    
  test "non-existent colour should raise error" do
    assert_raise(ArgumentError) do
      @variant.colour = "Non existing colour key"
    end
  end





  test "variants of different items can have the same colour and size" do
    clone = @variant.dup
    @variant.item = items(:one)
    clone.item = items(:three)
    
    @variant.save
    assert clone.valid?, clone.errors.full_messages.to_sentence
  end
  
  test "variants of different colours can have the same item and size" do
    clone = @variant.dup
    @variant.colour = 1
    clone.colour = 2
    
    @variant.save
    assert clone.valid?, clone.errors.full_messages.to_sentence
  end
  
  test "variants of different size can have the same item and colour" do
    clone = @variant.dup
    @variant.size = 1
    clone.size = 2
    
    @variant.save
    assert clone.valid?, clone.errors.full_messages.to_sentence
  end
  
  test "variants with the same item, colour and size should not be valid" do
    clone = @variant.dup
    @variant.save
    assert_not clone.valid?, "variant of same colour, item and size should be invalid"
  end
  
end
