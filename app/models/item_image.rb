class ItemImage < ApplicationRecord
  belongs_to :item
  
  validates :image_link, presence: true
end
