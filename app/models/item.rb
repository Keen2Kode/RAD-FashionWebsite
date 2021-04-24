class Item < ApplicationRecord
    enum size: [:small, :medium, :large, :extra_large]
    has_many :collection_items
        
    after_save :categories
    
    validates :name,            length: {maximum: 20},
                                presence: true
    validates :description,     length: {maximum: 140}
    # validates :colour
    # validates :image_link
    # validates :price
    # validates :purchases_count
    # validates :stock_count
    validates :arrival_date,    presence: true
    #important for new_ins collection
    
    # rather than storing categories as an array, have another table collection_items
    # so categories is a helper method to "simulate" an array
    def categories
        @categories = collection_items.map(&:category)
        # @categories << :new_ins
    end
end
