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

    # the trick is reassigning @random_item, this is used by the home controller to display new random item
    # the weird thing here is when we are on the last item, the @random_item is the same as @item (not sure why), so i need to nullify the @random_item when ALL the items are saved
    @random_item = Item.not_saved(saved).random.first
    if @random_item == @item
      # puts "PREV ITEM: " + @item.name
      @random_item = nil
    else
      # puts "NEW ITEM: " + @random_item.name
    end

    respond_to do |format|
      format.html
      format.js { render 'refresh_dynamic_partial.js.erb' }
    end
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
