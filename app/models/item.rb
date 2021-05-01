class Item < ApplicationRecord
    enum size: [:small, :medium, :large, :extra_large]
    validates :email, presence: true, 
                      length: { maximum: 50 },
                      format: { with: /\A\w+@\w+\.com\z/}
end
