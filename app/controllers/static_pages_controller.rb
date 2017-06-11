class StaticPagesController < ApplicationController
  def home
    @data1 = { 5 => 10, 8 => 5, 9 => 23, 15 => 15, 22 => 9 }
    @data2 = { 5 => 16, 8 => 2, 9 => 4, 15 => 9, 22 => 19 }
    @data3 = { 5 => 1, 8 => 5, 9 => 1, 15 => 3, 22 => 5 }
  end

  def help
  end

  def about
  end
end
