class Story < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments

  validates :title, :content, uniqueness: true
  validates :title, :content, presence: true
  validate :aggressive_authoring

  scope :alpha, -> { order(:title) }


  def aggressive_authoring
      stories_today = user.stories.select do |s|
        s.created_at.try(:to_date) == Date.today
    end

    if stories_today.size > 2 
      errors.add(:story_id, "You may not post more than twice per day.")
    end
  end

end
