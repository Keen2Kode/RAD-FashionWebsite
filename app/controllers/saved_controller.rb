class SavedController < ApplicationController
  
  
  
  
  def index
    # application controller method
    @items = saved.map{|id| Item.find_by(id: id)}
  end
  
  # for saved items for each user
  def db_index
    @saved_items = SavedItem.all
  end
  
  # PUT saved/1 
  # aka url: saved_path(1), method: put
  # when eg: you click on a popular item button (submitting a form)
  def update
    @item = Item.find(params[:id])
    logged_in? ? update_db : update_cookies
    saved.include?(@item.id) ? @item.decrement!(:popularity) : @item.increment!(:popularity)
  end
  
  
  
  
  
  
  
  
  
  
  private
  def update_db
    if saved.include? @item.id
      SavedItem.find_by(item: @item, user: current_user).delete
    else
      SavedItem.create(item: @item, user: current_user)
    end
  end
  
  def update_cookies
    saved.include?(@item.id) ? cookies_delete_saved(@item.id) : cookies_add_saved(@item.id)
  end
  
end
