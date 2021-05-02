class User < ApplicationRecord
    validates :name,        presence: true
    validates :password,    presence: true, 
                            length: {minimum: 8, maximum: 20},
                            format:  { with: /\A\w+\z/i}
    validates :email,       presence: true,
                            format:  { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},
                            uniqueness: { case_sensitive: false }
    # validate :password_correct_length
    before_save { email.downcase! }
    # using bcrypt
    has_secure_password
    
    
    def password_correct_length
        non_special_chars = password.scan(/\w/).count
        if non_special_chars < 8 || non_special_chars > 20 
            errors.add(:password, "Does not have 8-20 non-special characters")
        end
    end
end
