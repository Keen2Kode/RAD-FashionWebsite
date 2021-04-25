class CollectionsController < ApplicationController
  before_action :set_collection  # , only: %i[index show]
  def index
    @items = Item.all
  end

  def show
    @items = Item.all.select{|item| item.collections.include? @collection}
  end
  
  private
  
  def set_collection
    @collection = params[:id]
    # @category_name = CollectionItem.find(params[:value])
  end
end
