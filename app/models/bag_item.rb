class BagItem < ApplicationRecord
  belongs_to :item
  belongs_to :user
  
  validates :size,      presence: true
  validates :colour,    presence: true
  validates :quantity,  presence: true, 
                        numericality: {greater_than: 0}
  
  enum size: [:extra_small, :small, :medium, :large, :extra_large]
  enum colour: [:blue, :green, :black, :brown, :red]
end
