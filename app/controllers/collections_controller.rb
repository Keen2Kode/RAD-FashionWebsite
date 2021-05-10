class CollectionsController < ApplicationController
  before_action :set_collection
  
  def index
    redirect_to collection_path(CollectionItem.everything)
  end

  def show
    @items = Item.all.select{|item| item.collections.include? @collection}
    @items_enumerable = @items.each
  end
  
  private
  
  def set_collection
    # eg: collections/men gives "men"
    @collection = params[:id]
  end
end
