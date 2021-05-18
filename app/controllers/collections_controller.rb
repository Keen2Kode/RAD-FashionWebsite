class CollectionsController < ApplicationController
  before_action :set_collection
  
  def index
    redirect_to collection_path(CollectionItem.everything)
  end

  def show
    @items = Item.all.select{|item| item.collections.include? @collection}
    @items = search(params[:colours] - [''], params[:size], params[:tags] - ['']) if params[:colours]
    
  end
  
  
  
  
  
  def filter
  end
  
  def search
    
  end
  
  
  private
  
  def search(colours, size, tags)
    return [] if colours.empty? || tags.empty? || !size
    
    variants = ItemVariant.where(colour: colours).where(size: size)
    tags = TagItem.where(tag: tags)
    matches = variants.map(&:item) & tags.map(&:item)
    @items & matches
  end
  
  def set_collection
    # eg: collections/men gives "men"
    @collection = params[:id]
  end
end
