class SavedItem < ApplicationRecord
  belongs_to :item, dependent: :destroy
  belongs_to :user, dependent: :destroy
  
  validates :item,  presence: true, 
                    uniqueness: {scope: :user }
  validates :user,  presence: true
end
