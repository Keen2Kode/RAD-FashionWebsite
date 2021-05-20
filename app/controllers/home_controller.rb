class HomeController < ApplicationController
  
  
  
  
  def refresh_random
    puts "REFRESHING THE RANDOM PARTIAL PAGE..."
    @random_item = Item.random.first

    respond_to do |format|    
      format.html           
      format.js
    end       
  end
  
  
  def index
    @random_item = Item.random.not_saved(saved).first
    @popular_items = Item.all.sort_by(&:popularity).reverse
    @visitor = Visitor.new
    @collections = CollectionItem.collections
    
  end
  
  
  def search
    @items = Item.where("name ILIKE ?", "%#{params[:query]}%")
  end
  
  
  
  def newsletter
    @visitor = Visitor.new(visitor_params)
    render js: "alert('#{@visitor.save ? "Email successfully added!" : "Your email is invalid."}');"
  end
  
  
  
  
  
  
  
  
  
  
  
  
  private

  def item_params
    params.require(:item)
  end
  
  def visitor_params
    params.require(:visitor).permit(:email)
  end
  
end
