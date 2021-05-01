class SavedController < ApplicationController
  before_action :saved
  
  
  
  
  def index
    @saved_list = saved.map{|id| Item.find(id)}
  end
  
  # PUT saved/1 
  # aka url: saved_path(1), method: put)
  # when eg: you click on a popular item button (submitting a form)
  def update
    item_id = params.require(:item).require(:id)
    
    if saved.include? item_id
      session[:saved_list].delete(item_id)
    else
      session[:saved_list] << item_id
    end
  end
  
  
  
  
  
  
  private
  def saved
    session[:saved_list] ||= []
  end
end
