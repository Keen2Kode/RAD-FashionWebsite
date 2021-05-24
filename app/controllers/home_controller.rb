class HomeController < ApplicationController
  
  
  
  
  
  
  def index
    @random_item = Item.random.not_saved(saved).first
    @popular_items = Item.popular.take 5
    @visitor = Visitor.new
    @collections = CollectionItem.collections
    @popular_page = true
  end
  
  def popular
    @items = Item.popular
    @popular_page = true
  end
  
  def search
    @items = Item.where "name ILIKE ?", "%#{params[:query]}%"
  end
  
  
  
  def newsletter
    @visitor = Visitor.new(visitor_params)
    render js: "alert('#{@visitor.save ? "Email successfully added!" : "Your email is invalid."}');"
  end
  
  
  def admin
    redirect_to root_path, alert: "not authorized!" unless current_user&.admin
    @saved_items = SavedItem.all
    @purchased_items = BagItem.where(purchased: true)
    @visitors = Visitor.all
  end
  
  
  
  
  
  
  
  
  
  private
  
  def visitor_params
    params.require(:visitor).permit(:email)
  end
  
end
