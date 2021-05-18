class BagItem < ApplicationRecord
  # belongs_to :item
  belongs_to :user
  belongs_to :item_variant
  # bag_item -> item_variant -> item
  has_one :item, through: :item_variant
  
  validates :quantity,  presence: true, 
                        numericality: {greater_than: 0}
                        
  # adding the same bag item is valid,
  # but update the quantity VS saving the bag_item separately
  before_save { throw :abort if matching_bag_item}
  after_rollback :update_quantity
  
  
  
  
  
  
  def matching_bag_item
    user.bag_items.find_by(item_variant_id: item_variant.id)
  end
  
  def update_quantity
    updated_quantity = quantity + matching_bag_item.quantity
    matching_bag_item.update_column(:quantity, updated_quantity)
  end
  
end
