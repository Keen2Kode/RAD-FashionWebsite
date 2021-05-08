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
    BagItem.where(user_id: current_user).destroy_all
    redirect_to bag_items_path
  end
  
  
  private
  
  # def refresh_bag_items
  #   puts "CALLED REFREHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"
  #   redirect_to bag_items_path
  # end
  
  # if user is not logged in, the bag item params are saved until after login
  def persist_bag_item
    session[:bag_item] = params.require(:bag_item).permit(:item_id, :colour, :quantity, :size)
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
  
end
