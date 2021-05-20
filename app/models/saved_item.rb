class SavedItem < ApplicationRecord
  belongs_to :item
  belongs_to :user
  
  validates_uniqueness_of :item, scope: :user
end
