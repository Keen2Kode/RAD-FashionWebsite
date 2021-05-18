class BagItemsController < ApplicationController
  before_action :persist_bag_item, only: [:create]
  before_action :pathing_and_create_bag_item, only: [:index, :create]
  # after_action :refresh_bag_items, only: [:create, :destroy, :destroy_all]
  
  
  
  
  def index
    @bag_items = BagItem.where(user_id: current_user)
    @total_price = @bag_items.sum {|bag_item| bag_item.item.price * bag_item.quantity}
  end
  
  
  def create
    redirect_to bag_items_path
  end
  
  
  
  def destroy
    @bag_item = BagItem.find(params[:id])
    @bag_item.destroy
    redirect_to bag_items_path
  end
  
  
  def destroy_all
    @bag_items = BagItem.where(user_id: current_user)
    add_to_popularity(@bag_items)
    @bag_items.destroy_all
    redirect_to bag_items_path
  end
  
  
  private
  
  # def refresh_bag_items
  #   puts "CALLED REFREHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"
  #   redirect_to bag_items_path
  # end
  
  # if user is not logged in, the bag item params are saved until after login
  def persist_bag_item
    colour = params[:bag_item][:colour]
    size = params[:bag_item][:size]
    item_id = params[:bag_item][:item_id]
    variant = ItemVariant.find_by(colour: colour, size: size, item_id: item_id)
    
    session[:bag_item] = params.require(:bag_item).permit(:quantity).merge(item_variant: variant)
  end
  
  
  
  
  def pathing_and_create_bag_item
    set_back_path bag_items_path
    redirect_to prompt_path and return unless logged_in?
    
    create_bag_item
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
      bag_item.item.popularity += bag_item.quantity
      bag_item.item.save
    end
  end
  
end
