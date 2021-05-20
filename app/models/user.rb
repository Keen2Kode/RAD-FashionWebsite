class User < ApplicationRecord
    has_many :bag_items
    
    # scope :by_uid, ->(uid) { where("BINARY uid = ?", uid) }
    
    attribute :checkouts, default: 0
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
        user = User.find_by(email: email.downcase)
        if not user
            errors.add(:email, "#{email} not found")
        elsif not user.authenticate(password)
            errors.add(:password, "incorrect")
        end
    end
    
    def forgot_password_errors
        user = User.find_by(email: email.downcase)
        errors.add(:email, "#{email} not found") unless user
    end
    
    
    
    
    
    
    #subscribed to newsletter
    def visitor
        Visitor.find_by(email: email.downcase)
    end
    
    
    def reset_password_mail(request)
        UserMailer.with(user: self).reset_password(request).deliver_now
    end
    
    def self.find_by_signed_id(token)
        GlobalID::Locator.locate_signed(token)
    end

    def self.find_or_create_from_auth_hash(auth_hash)
        # this won't work because of validations on password and email above
        # the Twitter will not be persisted on the users table
        user = User.where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
        user.update(
            name: auth_hash.info.nickname,
            profile_image: auth_hash.info.image,
            token: auth_hash.credentials.token,
            secret: auth_hash.credentials.secret
        )
        user
    end
end
