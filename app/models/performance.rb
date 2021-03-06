class Performance < ApplicationRecord
    belongs_to :user

    has_many :comments
    has_many :users, through: :comments

    validates :performer, presence: true, uniqueness: true
    validates :piece, presence: true
    validates :video, presence: true

    scope :search, -> (params){where("LOWER(performer) LIKE ?", "%#{params}%")}

end
