class TagItem < ApplicationRecord
    # :all doesn't belong here, it's a condition
    enum tag: [:dresses, :blazers, :t_shirts, :jumpers, :shoes]
    belongs_to :item
    validates_uniqueness_of :tag, scope: :item_id
    
end
