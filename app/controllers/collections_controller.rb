class CollectionsController < ApplicationController
  before_action :set_collection
  
  def index
    redirect_to collection_path(CollectionItem.everything)
  end

  def show
    @items = Item.all.select{|item| item.collections.include? @collection}
    @items_enumerable = @items.each
    
    # Filter: this was a confusing requirement, as this implies colour and size is an intrinsic property of item
    # but contradicts with the Shopping Bag feature, where you can *re-choose* the colour and size
    # we have assumed all items are stocked with EVERY colour + size combination
    # colours = BagItem.colours.keys
    # sizes = BagItem.sizes.keys
    # @bag_items = colours.product(sizes).map {|p| BagItem.new(colour: p[0], size: p[1])}
  end
  
  
  
  
  
  def filter
    @tags = ['all'] + TagItem.tags.keys
    @colours = BagItem.colours.keys
  end
  
  def search
  end
  
  private
  
  def set_collection
    # eg: collections/men gives "men"
    @collection = params[:id]
  end
end
