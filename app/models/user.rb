class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true, uniqueness: true
    validates :password, length: {minimum: 6, allow_nil: true}
    validates :email, presence: true, uniqueness: true

end