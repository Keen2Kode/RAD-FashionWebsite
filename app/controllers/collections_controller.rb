class CollectionsController < ApplicationController
  before_action :set_collection  # , only: %i[index show]
  def index
  end

  def show
    @items = Item.all.select do |item| 
      categories = item.collection_items.map(&:category)
      categories.include? @category 
    end
    # Item.all.select do |item| 
    #   item.collection_items.each do |ci| 
    #     if ci.category == @category
          
    #     end
    # end
  end
  
  private
  
  def set_collection
    @category = params[:id]
    # @category_name = CollectionItem.find(params[:value])
  end
end
