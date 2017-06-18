require 'test_helper'

class StackTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @stack = Stack.new(name: "401K", 
                       description: "Charles Schwab Bank Taxable Brokerage Account", 
                       user_id: @user.id)
  end
  
  test "should be valid" do
    assert @stack.valid?
  end
  
  test "user id should be present" do
    assert @stack.user_id != nil
    @stack.user_id = nil
    assert_not @stack.valid?
  end
  
end
