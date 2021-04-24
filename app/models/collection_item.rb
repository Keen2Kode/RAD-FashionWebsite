class CollectionItem < ApplicationRecord
    enum category: [:men, :women, :kids, :new_ins]
    belongs_to :item
    # :new_ins is a condition based on the arrival date, not an enum
    # before_save : check new_ins works with arrival date
    validates_uniqueness_of :category, :scope => :item_id
    
    # def arrival_date_cannot_be_in_the_future
    #     if arrival_date.present? && arrival_date > Date.today
    #         errors.add(:arrival_date, "can't be in the future")
    #     end
    # end
    
  
end
