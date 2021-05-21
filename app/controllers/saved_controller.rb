class SavedController < ApplicationController
  
  
  
  
  def index
    @items = saved.map{|id| Item.find_by(id: id)}
  end
  
  # for saved items for each user
  def db_index
    @saved_items = SavedItem.all
    @items = current_user.saved_items.map(&:item) if logged_in?
  end
  
  # PUT saved/1 
  # aka url: saved_path(1), method: put
  # when eg: you click on a popular item button (submitting a form)
  def update
    @item = Item.find(params[:id])
    
    if saved.include? @item.id
      delete_saved
      @item.popularity -= 1
    else
      add_saved
      @item.popularity += 1
    end
    
    @item.save
  end
  
  
  
  
  
  
  
  
  
  
  private
  
  def delete_saved
    cookies_delete_saved @item.id
    SavedItem.find_by(item: @item, user: current_user).delete if logged_in?
  end
  
  def add_saved
    cookies_add_saved @item.id
    SavedItem.create(item: @item, user: current_user) if logged_in?
  end
end
