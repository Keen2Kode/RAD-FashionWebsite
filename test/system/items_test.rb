require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "creating a Item" do
    visit items_url
    click_on "New Item"

    fill_in "Arrival date", with: @item.arrival_date
    fill_in "Colour", with: @item.colour
    fill_in "Description", with: @item.description
    fill_in "Image link", with: @item.image_link
    fill_in "Name", with: @item.name
    fill_in "Price", with: @item.price
    fill_in "Purchases count", with: @item.purchases_count
    fill_in "Size", with: @item.size
    fill_in "Stock count", with: @item.stock_count
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "updating a Item" do
    visit items_url
    click_on "Edit", match: :first

    fill_in "Arrival date", with: @item.arrival_date
    fill_in "Colour", with: @item.colour
    fill_in "Description", with: @item.description
    fill_in "Image link", with: @item.image_link
    fill_in "Name", with: @item.name
    fill_in "Price", with: @item.price
    fill_in "Purchases count", with: @item.purchases_count
    fill_in "Size", with: @item.size
    fill_in "Stock count", with: @item.stock_count
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item" do
    visit items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end
