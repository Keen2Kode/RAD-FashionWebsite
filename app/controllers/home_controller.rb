class HomeController < ApplicationController
  
  
  
  
  
  
  
  def index
    @random_item = Item.order(Arel.sql('RANDOM()')).first
    @popular_items = Item.all.reverse.take(8)
    @visitor = Visitor.new
    # [:men, :women, :kids, :new_ins]
    @collections = CollectionItem.categories.keys + [CollectionItem.new_ins]
  end
  
  def newsletter
    # noee    params[:commit] == "Subscribe"
    @visitor = Visitor.new(visitor_params)
    render js: "alert('#{@visitor.save ? "Email successfully added!" : "Your email is invalid."}');"
    logger.info @visitor.errors.full_messages.to_sentence
  end
  
  
  
  
  
  
  
  
  
  
  
  
  private

  def item_params
    params.require(:item)
  end
  
  def visitor_params
    params.require(:visitor).permit(:email)
  end
  
end
