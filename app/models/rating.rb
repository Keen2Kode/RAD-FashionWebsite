class Rating < ApplicationRecord
    belongs_to :user
  
    validates :value, presence: true
    validates :user, presence: true
    
end
