class User < ApplicationRecord
    has_secure_password
    
    has_many :created_performances, foreign_key: 'user_id', class_name: 'Performance'
    has_many :comments
    has_many :performances, through: :comments
 
end
