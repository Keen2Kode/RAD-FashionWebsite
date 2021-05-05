class Item < ApplicationRecord
    has_many :collection_items, dependent: :destroy
    has_many :bag_items, dependent: :destroy
    
    after_save :collections, :new_arrival
    validates :name,            length: {maximum: 20},
                                presence: true
    validates :description,     length: {maximum: 140}
    # validates :colour
    # validates :image_link
    # validates :price
    # validates :purchases_count
    # validates :stock_count
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
end
