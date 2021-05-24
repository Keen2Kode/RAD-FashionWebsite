class BagItem < ApplicationRecord
  belongs_to :user
  belongs_to :item_variant
  # bag_item -> item_variant -> item
  has_one :item, through: :item_variant
  
  attribute :purchased,     default: false
  validates :quantity,      presence: true, 
                            numericality: {greater_than: 0}
  validates :user,          presence: true
  validates :item_variant,  presence: true
                        
  # adding the same bag item is valid,
  # but update the quantity VS saving the bag_item separately
  before_save { throw :abort if matching_bag_item}
  after_rollback :update_quantity
  
  
  
  
  
  
  def matching_bag_item
    # purchased: a bag item that's still not checked out shouldn't be added to one post checkout
    user.bag_items.find_by(item_variant_id: item_variant.id, purchased: purchased)
  end
  
  def update_quantity
    updated_quantity = quantity + matching_bag_item.quantity
    matching_bag_item.update_column(:quantity, updated_quantity)
  end
  
end
