class CollectionItem < ApplicationRecord
    enum category: [:men, :women, :kids, :new_ins]
    # :new_ins is a condition based on the arrival date, not an enum
    # before_save : check new_ins works with arrival date
    
    belongs_to :item
  
end
