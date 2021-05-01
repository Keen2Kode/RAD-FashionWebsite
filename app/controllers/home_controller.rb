class HomeController < ApplicationController
  before_action :set_subscribed #, only: %i[index]
  
  def index
    @random_item = Item.order('RANDOM()').first
    @popular_items = Item.all.reverse.take(4)
    @visitor ||= Visitor.new
    # [:men, :women, :kids, :new_ins]
    @collections = CollectionItem.categories.keys + [CollectionItem.new_ins]
  end
  
  def create
    if clicked_subscribe_button?
      @visitor = Visitor.new(visitor_params)
      render js: "alert('#{@visitor.save ? "Email successfully added!" : "Your email is invalid."}');"
      logger.info @visitor.errors.full_messages.to_sentence
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
