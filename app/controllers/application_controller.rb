require 'market_beat'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
#  def hello
#    test = MarketBeat.last_trade_real_time :DIA
#    render html: "Hello world, testing github push #{test} aksndfknnkj"
#  end
end