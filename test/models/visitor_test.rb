require 'test_helper'

class VisitorTest < ActiveSupport::TestCase
  
  def setup
    @visitor = Visitor.new(email: "lfkajsklfja_akl@my-app.com")
  end
  
  test "should be valid" do
    assert @visitor.valid?
  end
  
  
  
  
  
  
  
  
  test "email should be present" do
    @visitor.email = " "
    assert_not @visitor.valid?
  end
  
  test "good emails pass" do
    valid_emails = %w[joe@apple.com TEST@EXP.ORG joe_s@a-School.net 
    alex.smith@topshop.biz don+z@136.co]
    valid_emails.each do |email|
      @visitor.email = email
      assert @visitor.valid?, "#{email.inspect} should be valid"
    end
  end
  
  test "bad emails rejected" do
    invalid_emails = %w[joe@apple,com TEST@@EXP.ORG joe_s@a_School.net
    alex.smith@top shop.biz don+z@13+6.co]
    invalid_emails.each do | email |
      @visitor.email = email
      assert_not @visitor.valid?, "#{email.inspect} should be invalid"
    end
  end

  test "email addresses unique" do
    clone = @visitor.dup
    clone.email = @visitor.email.upcase
    @visitor.save
    assert_not clone.valid?
  end
 
  test "email addresses saved as lower-case" do
    mixed_case_email = "Joe@RAd.oRg.AU"
    @visitor.email = mixed_case_email
    @visitor.save!
    assert_equal mixed_case_email.downcase, @visitor.reload.email
  end

end
