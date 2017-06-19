require 'test_helper'

class StockTest < ActiveSupport::TestCase

  def setup
    @stack = stacks(:brokerage)
    @stock = @stack.stocks.build(ticker: "SCHA", name: "Schwab U.S. Small-Cap ETF")
  end
  
  test "should be valid" do
    assert @stock.valid?
  end
  
  test "name should not be blank" do
    @stock.name = "   "
    assert_not @stock.valid?
  end
  
  test "ticker should not be blank" do
    @stock.ticker = "   "
    assert_not @stock.valid?
  end
  
  test "stack id should be present" do
    @stock.stack_id = nil
    assert_not @stock.valid?
  end
  
end
