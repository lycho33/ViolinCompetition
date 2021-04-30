class User < ApplicationRecord
    has_many :created_performances, foreign_key: 'user_id', class_name: 'Performance'
    has_many :comments
    has_many :performances, through: :comments
 
    has_secure_password
end
