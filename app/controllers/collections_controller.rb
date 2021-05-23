class CollectionsController < ApplicationController
  before_action :set_collection_or_redirect
  
  def index
    redirect_to collection_path(CollectionItem.everything)
  end

  def show
    @items = Item.all.select{|item| item.collections.include? @collection}
    @items = search if params[:colours]
  end
  
  
  
  private
  
  def search
    colours = params[:colours] - ['']
    size = params[:size]
    tags = params[:tags] - ['']

    @items & Item.filter(colours, size, tags)
  end
  
  
  def set_collection_or_redirect
    # eg: collections/men gives "men"
    @collection = params[:id]
    valid_collections = CollectionItem.collections + [CollectionItem.everything]
    redirect_to collection_path(CollectionItem.everything) unless valid_collections.include? @collection
  end
end
