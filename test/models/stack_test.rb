require 'test_helper'

class StackTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    # make a stack through its association with a user
    # build returns an object in memory but doesn't modify the database
    @stack = @user.stacks.build(name: "401K", description: "Charles Schwab Bank Taxable Brokerage Account")
  end
  
  test "should be valid" do
    assert @stack.valid?
  end
  
  test "user id should be present" do
    @stack.user_id = nil
    assert_not @stack.valid?
  end
  
  test "name should be present" do
    @stack.name = "     "
    assert_not @stack.valid?
  end
  
  test "description should be present and at most 155 characters" do
    @stack.description = "     "
    assert_not @stack.valid?
    @stack.description = "a" * 156
    assert_not @stack.valid?
  end
end
