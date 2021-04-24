class Item < ApplicationRecord
    enum size: [:small, :medium, :large, :extra_large]
end
