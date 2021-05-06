class BagItem < ApplicationRecord
  belongs_to :item
  belongs_to :user
  
  validates :size,      presence: true
  validates :colour,    presence: true
  validates :quantity,  presence: true, 
                        numericality: {greater_than: 0}
                        
  # updating item, cancel save
  before_save :matching_bag_items?
  after_rollback :update_quantity
  # validate :update_quantity
  
  enum size: [:extra_small, :small, :medium, :large, :extra_large]
  enum colour: [:blue, :green, :black, :brown, :red]
  
  def matching_bag_items?
    @matching_bag_item = user.bag_items.find_by(item_id: item.id, colour: colour, size: size)
    throw :abort if @matching_bag_item
  end
  
  def update_quantity
    updated_quantity = quantity + @matching_bag_item.quantity
    @matching_bag_item.update_column(:quantity, updated_quantity)
  end
  
end
