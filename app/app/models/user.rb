class User < ApplicationRecord
    has_many :preferences
    validates :username, presence: true, 
        uniqueness:{case_sensitive: false}, 
        length: {minimum: 3, maximum: 25}
    validates :fullname, presence: true, 
        length: {minimum: 1, maximum: 105}
    has_secure_password
end