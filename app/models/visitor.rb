class Visitor < ApplicationRecord
    validates :email,   length: {maximum: 25},
                        presence: true,
                        format: { with: /\A\w+@\w+\.com\z/},
                        uniqueness: true
                        
    @@subscribed = false
    def self.things
        @@subscribed
    end
    def self.thongs
        @@subscribed = true
    end
end
