class HomeController < ApplicationController
  
  
  
  
  
  
  
  def index
    @random_item = Item.order(Arel.sql('RANDOM()')).first
    @popular_items = Item.all.sort_by(&:popularity).reverse
    @visitor = Visitor.new
    @collections = CollectionItem.collections
  end
  
  
  def search_post
    redirect_to search_path(query: params[:query])
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
