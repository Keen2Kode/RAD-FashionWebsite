class BagItemsController < ApplicationController
  before_action :prompt_login, only: [:index, :create]
  # after_action :refresh_bag_items, only: [:create, :destroy]
  
  
  
  
  def index
    @bag_items = BagItem.where(user_id: current_user)
    @total_price = @bag_items.sum {|bag_item| bag_item.item.price * bag_item.quantity}
  end
  
  
  def create
    @bag_item = BagItem.new(bag_item_params)
    @bag_item.save
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
  
  def prompt_login
    redirect_to prompt_path unless logged_in?
  end
  
  # def refresh_bag_items
  #   redirect_to bag_items_path
  # end
  
  
  def bag_item_params
    params.require(:bag_item).permit(:item_id, :colour, :quantity, :size).merge(user_id: current_user.id)
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
