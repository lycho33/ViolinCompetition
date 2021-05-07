class User < ApplicationRecord
    has_secure_password
    
    has_many :created_performances, foreign_key: 'user_id', class_name: 'Performance'
    has_many :comments
    has_many :performances, through: :comments
    has_many :blogs

    validates :username, presence: true
    validates :password_digest, presence: true, uniqueness: true
end
