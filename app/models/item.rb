class Item < ApplicationRecord
    enum size: [:small, :medium, :large, :extra_large]
    has_many :collection_items
end
