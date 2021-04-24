class CollectionItem < ApplicationRecord
    # categories for the whole array, rails is smart like that
    enum category: [:men, :women, :children, :new_ins]
    belongs_to :item
  
end
