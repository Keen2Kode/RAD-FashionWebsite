class Visitor < ApplicationRecord
    validates :email,       presence: true,
                            # using the regex provided in tute 7, works with student email
                            format:  { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},
                            uniqueness: { case_sensitive: false }
    before_save { email.downcase! }
    

end
