class SavedController < ApplicationController
  include SavedHelper
  
  
  
  
  def index
    @items = saved.map{|id| Item.find_by(id: id)}
  end
  
  # PUT saved/1 
  # aka url: saved_path(1), method: put
  # when eg: you click on a popular item button (submitting a form)
  def update
    item = Item.find(params[:id])
    
    if saved.include? item.id
      delete_saved item.id
      item.popularity -= 1
    else
      add_saved item.id
      item.popularity += 1
    end
    
    item.save
  end
  
end
