require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  # tests inferred from RAD tute 7
  
  def setup
    @user = User.new(name: "RAD", email: "rad2021rmit@gmail.com",
    #8-20 non special (\w) characters
    password: "Rails2021", password_confirmation: "Rails2021")
  end
  
  
  
  
  
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end
  
  
  
  
  
  
  
  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end
  
  test "good emails pass" do
    valid_emails = %w[joe@apple.com TEST@EXP.ORG joe_s@a-School.net 
    alex.smith@topshop.biz don+z@136.co]
    valid_emails.each do |email|
      @user.email = email
      assert @user.valid?, "#{email.inspect} should be valid"
    end
  end
  
  test "bad emails rejected" do
    invalid_emails = %w[joe@apple,com TEST@@EXP.ORG joe_s@a_School.net
    alex.smith@top shop.biz don+z@13+6.co]
    invalid_emails.each do | email |
      @user.email = email
      assert_not @user.valid?, "#{email.inspect} should be invalid"
    end
  end

  test "email addresses unique" do
    clone = @user.dup
    clone.email = @user.email.upcase
    @user.save
    assert_not clone.valid?
  end
 
  test "email addresses saved as lower-case" do
    mixed_case_email = "Joe@RAd.oRg.AU"
    @user.email = mixed_case_email
    @user.save!
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
  
  
  
  
  
  
  test "password not blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  
  test "password between 8-20 chars valid" do
    @user.password = @user.password_confirmation = "x" * 8
    assert @user.valid?
  end
  
  test "password less than 8 chars invalid" do
    @user.password = @user.password_confirmation = "x" * 7
    assert_not @user.valid?
  end
  
  test "password more than 20 chars invalid" do
    @user.password = @user.password_confirmation = "x" * 21
    assert_not @user.valid?
  end
  
  # I interpreted "excluding special chars" to be not of the length, but excluded entirely within the password
  test "password with special chars invalid" do
    @user.password = @user.password_confirmation = "#" * 19
    assert_not @user.valid?
  end
  
  
end
