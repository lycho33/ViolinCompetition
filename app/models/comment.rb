class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :performance

  validates :content, presence: true
end
