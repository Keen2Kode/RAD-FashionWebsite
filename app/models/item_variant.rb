class ItemVariant < ApplicationRecord
    belongs_to :item
    
    validates :size,      presence: true
    validates :colour,    presence: true
    validate :no_matching_variant
    
    enum size: [:extra_small, :small, :medium, :large, :extra_large]
    enum colour: [:blue, :green, :black, :brown, :red]
    
    def no_matching_variant
        if item.item_variants.find_by(item_id: item.id, colour: colour, size: size)
            errors.add(:size, " #{size} Variant already exists")
        end
    end

end
