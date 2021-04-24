class HomeController < ApplicationController
  before_action :set_subscribed #, only: %i[index]
  
  def index
    @random_item = Item.order('RANDOM()').first
    @popular_items = Item.all.reverse.take(4)
    @visitor ||= Visitor.new
  end
  
  def create
    # redirect_to collections_men_path
    if clicked_subscribe_button?
      @visitor = Visitor.new(visitor_params)
      Visitor.thongs if @visitor.save
      redirect_to root_path
    end
  end
  
  private
  
  def clicked_subscribe_button?
    params[:commit] == "Subscribe"
  end
  
  def visitor_params
    params.require(:visitor).permit(:email)
  end
  
  # Use callbacks to share common setup or constraints between actions.
  def set_subscribed
    @subscribed = Visitor.things
  end
end
