class HomeController < ApplicationController
  
  def index
    @random_item = Item.order('RANDOM()').first
    @popular_items = Item.all.reverse.take(4)
  end
  
  def create
    render html: '<div>html goes here</div>' # if params[:commit] == "Subscribe"
  end
end
