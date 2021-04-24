class Visitor < ApplicationRecord
    validates :email,   length: {maximum: 10},
                        presence: true
                        
    @@subscribed = false
    def self.things
        @@subscribed
    end
    def self.thongs
        @@subscribed = true
    end
end
