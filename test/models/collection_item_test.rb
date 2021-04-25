require 'test_helper'

class CollectionItemTest < ActiveSupport::TestCase
  def setup
    @category = CollectionItem.new(item_id: 10, category: 2)
  end
  
  test "should be valid" do
    assert @category.valid?
  end
  
  # test "name should be present" do
  #   @customer.username = " "
  #   # need to add validation in Customer/model like "validates :username, presence: true"
  #   # to avoid "  "for this test to work
  #   assert_not @customer.valid?
  # end
  
  # test "email should be present" do
  #   @customer.email = " "
  #   assert_not @customer.valid?
  # end
  
  
  
  
  
  # test "username should not be too long" do
  #   @customer.username = "x" * 26
  #   assert_not @customer.valid?
  # end
 
  # test "email should not be too long" do
  #   @customer.email = "x" * 100 + "@example.com"
  #   assert_not @customer.valid?
  # end
  
  
  
  
  
  
  
  # test "good emails should pass" do
  #   # A list of valid emails
  #   valid_emails = %w[joe@apple.com TEST@EXP.ORG joe_s@a-School.net alex.smith@topshop.biz don+z@136.co]
  #   valid_emails.each do |email|
  #     @customer.email = email
  #     assert @customer.valid?, "#{email.inspect} should be valid"
  #   end
  # end
 
 
  # test "bad emails should be rejected" do
  #   invalid_emails =["joe@apple,com TEST@@EXP.ORG", "joe_s@a_School.net", "alex.smith@top", "shop.biz don+z@13+6.co"]
  #   invalid_emails.each do | email |
  #     @customer.email = email
  #     assert_not @customer.valid?, "#{email.inspect} should be invalid"
  #   end
  # end
  
  
  
  
  
  
  
  
  # test "emails should be unique" do
  #   clone = @customer.dup
  #   clone.email = @customer.email
  #   @customer.save
  #   assert_not clone.valid?
  # end
  
  
  
  
  
  # test "email addresses should be saved as lower-case" do
  #   mixed_case_email = "Joe@RAd.oRg.AU"
  #   @customer.email = mixed_case_email
  #   @customer.save
  #   assert_equal mixed_case_email.downcase, @customer.reload.email
  # end
end
