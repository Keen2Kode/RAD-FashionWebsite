class User < ApplicationRecord
    validates :name,        presence: true,
                            uniqueness: true
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
    
    # generates login errors with a dummy user object
    def login_errors(name, password)
        user = User.find_by(name: name)
        if not user
            errors.add(:name, "#{name} not found")
        elsif not user.authenticate(password)
            errors.add(:password, "incorrect")
        end
    end
end
