class HomeController < ApplicationController
  
  def index
    @random_item = Item.order('RANDOM()').first
    @popular_items = Item.all.reverse.take(4)
  end
end
