class Story < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments

  scope :alpha, -> { order(:title) }
end
