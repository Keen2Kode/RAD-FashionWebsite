class Item < ApplicationRecord
    has_many :collection_items, dependent: :destroy
    has_many :tag_items, dependent: :destroy
    has_many :item_images, dependent: :destroy
    has_many :item_variants, dependent: :destroy
    
    scope :random, ->                   { Item.order(Arel.sql('RANDOM()')) }
    scope :not_saved, -> (saved_list)   { Item.where.not(id: saved_list) }
    scope :popular, ->                  { Item.all.sort_by(&:popularity).reverse }

    
    # Popularity feature: the sum of appearances in saved list and shopping bag
    before_validation { self.popularity = 0 unless self.popularity }
    after_save :collections, :new_arrival
    validates :name,            presence: true,
                                uniqueness: {case_sensitive: false}
    validates :popularity,      presence: true, 
                                numericality: {greater_than_or_equal_to: 0}
    validates :description,     length: {maximum: 140}
    validates :price,           presence: true,
                                numericality: {greater_than_or_equal_to: 0}
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
    
    def variants_for(attribute, from_size = nil, from_colour = nil)
        output = nil
        if from_size == nil && from_colour == nil
            output = item_variants
        elsif from_size != nil && from_colour == nil
            output = item_variants.where(size: from_size)
        elsif from_colour != nil && from_size == nil
            output = item_variants.where(colour: from_colour)
        else
            output = item_variants.where(size: from_size, colour: from_colour)
        end
        output = output.map(&attribute).uniq
        output
    end
    
    def self.filter(colours, size, tags)
        return [] if colours.empty? || tags.empty? || !size
    
        variants = ItemVariant.where(colour: colours).where(size: size)
        tags = TagItem.where(tag: tags)
        variants.map(&:item) & tags.map(&:item)
    end
end
