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
    def login_errors
        user = User.find_by(email: email)
        if not user
            errors.add(:email, "#{email} not found")
        elsif not user.authenticate(password)
            errors.add(:password, "incorrect")
        end
    end
    
    def forgot_password_errors
        user = User.find_by(email: email)
        errors.add(:email, "#{email} not found") unless user
    end
    
    
    
    
    
    
    #subscribed to newsletter
    def visitor
        Visitor.find_by(email: email)
    end
    
    
    def reset_password_mail(request)
        UserMailer.with(user: self).reset_password(request).deliver_now
    end
    
    def self.find_by_signed_id(token)
        GlobalID::Locator.locate_signed(token)
    end
end
