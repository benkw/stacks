require 'market_beat'

# this is the base class of all controllers
class ApplicationController < ActionController::Base
  # Use this controller to define related functions for use
  # across multiple controllers and views
  
  protect_from_forgery with: :exception
  include SessionsHelper
  
#  def hello
#    test = MarketBeat.last_trade_real_time :DIA
#    render html: "Hello world, testing github push #{test} aksndfknnkj"
#  end
end