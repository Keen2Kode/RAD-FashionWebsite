class SavedItem < ApplicationRecord
  belongs_to :item, dependent: :destroy
  belongs_to :user, dependent: :destroy
  
  validates_uniqueness_of :item, scope: :user
end
