require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  def setup
    @item = Item.new(name: "Chef's hat", description: "blah", price: 20.0, arrival_date: Date.today)

  end
  
  test "should be valid" do
    assert @item.valid?
  end
  
  test "name should be present" do
    @item.name = " "
    assert_not @item.valid?
  end
  
  test "name should be case_insensitive unique" do
    clone = @item.dup
    clone.name.downcase!
    @item.save
    assert_not clone.valid?
  end
  
  
  
  
  
  test "popularity should be default zero" do
    # the popularity was not set for this item
    @item.save
    assert_equal 0, @item.popularity
  end
  
  test "description more than 140 chars invalid" do
    @item.description = "x" * 141
    assert_not @item.valid?
  end
  
  
  
  
  
  
  test "arrival date cannot be in the future" do
    @item.arrival_date = Date.today + 2.months
    assert_not @item.valid?
  end
  
  test "arrival date less than 3 months considered new arrival" do
    @item.arrival_date = Date.today - 2.months
    @item.save
    assert @item.new_arrival
  end
  
  test "arrival date more than 3 months considered old arrival" do
    @item.arrival_date = Date.today - 3.months
    @item.save
    assert_not @item.new_arrival
  end  
  
  
  
  
  
  
  test "scope popular has most popular item first" do
    max_popularity = Item.all.map(&:popularity).max
    @item.popularity = max_popularity+1
    @item.save
    assert_equal @item, Item.popular.first
  end
  
  test "scope popular has least popular item last" do
    @item.save
    assert_equal @item, Item.popular.last
  end
end
