class CollectionItem < ApplicationRecord
  
  belongs_to :item
  # new_ins doesn't really belong in database, it's a condition
  enum category: [:men, :women, :kids]
  
  validates :item,      presence: true
  validates :category,  presence: true,
                        uniqueness: { scope: :item }
  
  def self.new_ins
    "new_ins"
  end
  
  def self.everything
    "all"
  end
  
  # [:men, :women, :kids, :new_ins]
  def self.collections
    self.categories.keys + [self.new_ins]
  end
  
end
