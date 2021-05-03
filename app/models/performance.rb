class Performance < ApplicationRecord
    belongs_to :user

    has_many :comments
    has_many :users, through: :comments

    validates :performer, presence: true, uniqueness: true
    validates :piece, presence: true
    validates :video, presence: true

    

    def self.search(params)
        Performance.where("LOWER(performer) LIKE ?", "%#{params}%")
    end
end
