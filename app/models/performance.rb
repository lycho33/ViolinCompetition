class Performance < ApplicationRecord
    belongs_to :user

    has_many :comments
    has_many :users, through: :comments

    has_one :performer
end
