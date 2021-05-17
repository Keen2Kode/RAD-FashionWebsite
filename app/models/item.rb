class Item < ApplicationRecord
    has_many :collection_items, dependent: :destroy
    has_many :tag_items, dependent: :destroy
    has_many :item_images, dependent: :destroy
    has_many :item_variants, dependent: :destroy

    
    # Popularity feature: the sum of appearances in saved list and shopping bag
    before_validation { self.popularity = 0 unless self.popularity }
    after_save :collections, :new_arrival
    validates :name,            presence: true
    validates :popularity,      presence: true, 
                                numericality: {greater_than_or_equal_to: 0}
    validates :description,     length: {maximum: 140}
    validates :arrival_date,    presence: true
    validate :arrival_date_cannot_be_in_the_future
    
    
    
    
    
    
    
    
    #important for new_ins collection
    def arrival_date_cannot_be_in_the_future
        errors.add(:arrival_date, "can't be in the future") if arrival_date > Date.today
    end
    
    # helper method to "simulate" an array of collections
    def collections
        @collections = collection_items.map(&:category)
        @collections << CollectionItem.new_ins if new_arrival
        @collections << CollectionItem.everything
        @collections
    end
    
    def new_arrival
        arrival_date > Date.today - 3.months
    end
    
    def variants_of(attribute)
        item_variants.map(&attribute).uniq
    end
end
