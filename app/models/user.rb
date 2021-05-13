class User < ApplicationRecord
    has_many :bag_items
    
    validates :name,        presence: true,
                            uniqueness: true
    validates :password,    presence: true, 
                            length: {minimum: 8, maximum: 20},
                            format:  { with: /\A\w+\z/i}
    validates :email,       presence: true,
                            format:  { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},
                            uniqueness: { case_sensitive: false }
    before_save { email.downcase! }
    # using bcrypt
    has_secure_password
    
    
    # generates login errors with a dummy user object
    def login_errors(name, password)
        user = User.find_by(name: name)
        if not user
            errors.add(:name, "#{name} not found")
        elsif not user.authenticate(password)
            errors.add(:password, "incorrect")
        end
    end
    
    #subscribed to newsletter
    def visitor
        puts "emaillllllllllllllllllll: #{email}"
        puts "is A VISTORR? #{Visitor.find_by(email: email)}"
        Visitor.find_by(email: email)
    end
end
