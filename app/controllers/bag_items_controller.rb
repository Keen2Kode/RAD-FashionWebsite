class BagItemsController < ApplicationController
  before_action :persist_bag_item, only: [:create]
  before_action :redirect_prompt
  
  
  
  
  def index
    create_bag_item
    @bag_items = BagItem.where(user_id: current_user, purchased: false)
    @total_price = @bag_items.sum {|bag_item| bag_item.item.price * bag_item.quantity}
  end
  
  
  def create
    create_bag_item
    redirect_to bag_items_path
  end
  
  
  
  def destroy
    @bag_item = BagItem.find(params[:id])
    @bag_item.destroy
    redirect_to bag_items_path
  end
  
  
  def checkout
    @bag_items = BagItem.where(user_id: current_user, purchased: false)
    add_to_popularity(@bag_items)
    @bag_items.update_all(purchased: true)
    
    
    current_user.increment!(:checkouts)

    if current_user.checkouts == 1
      respond_to do |format|
        format.js { render 'bag_items/first_checkout_modal.js.erb' }
      end
    else
      redirect_to root_path
    end
  end
  
  
  private
  
  
  # if user is not logged in, the bag item params are saved until after login
  def persist_bag_item
    colour = params[:bag_item][:colour]
    size = params[:bag_item][:size]
    item_id = params[:bag_item][:item_id]
    variant = ItemVariant.find_by(colour: colour, size: size, item_id: item_id)
    session[:bag_item] = params.require(:bag_item).permit(:quantity).merge(item_variant_id: variant.id)
  end
  
  
  
  
  def redirect_prompt
    set_back_path bag_items_path
    redirect_to prompt_path and return unless logged_in?
  end
  
  
  
  
  def create_bag_item
    return unless session[:bag_item]
    
    @bag_item = BagItem.new(session[:bag_item])
    @bag_item.user_id = current_user.id
    @bag_item.save
    session.delete(:bag_item)
  end
  
  
  # popularity: an item is counted as "appeared in shopping bag" when it is checked out
  # prevents spam of user constantly adding and removing the same item to "inflate" popularity
  def add_to_popularity(bag_items)
    bag_items.each do |bag_item|
      bag_item.item.increment!(:popularity, by = bag_item.quantity)
    end
  end
  
end
