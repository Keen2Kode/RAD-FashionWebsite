class SavedController < ApplicationController
  before_action :saved
  
  
  
  
  def index
    @saved_list = saved.map{|id| Item.find(id)}
  end
  
  # PUT saved/1 
  # aka url: saved_path(1), method: put)
  # when eg: you click on a popular item button (submitting a form)
  def update
    item = Item.find(params[:id])
    
    if saved.include? item.id
      session[:saved_list].delete(item.id)
      item.popularity -= 1
    else
      session[:saved_list] << item.id
      item.popularity += 1
    end
    
    item.save
  end
  
  
  
  
  
  
  private
  def saved
    session[:saved_list] ||= []
  end
end
