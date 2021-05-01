class CollectionItem < ApplicationRecord
    # new_ins doesn't really belong in database, it's a condition
    enum category: [:men, :women, :kids]
    belongs_to :item
    validates_uniqueness_of :category, :scope => :item_ids
    
    def self.new_ins
        "new_ins"
    end
    
    def self.everything
        "all"
    end
    
  
end
