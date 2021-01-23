class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :story
    
    validates :content, presence: true
    validates :story, uniqueness: {scope: :user_id, message: "Only one comment per user allowed"}
end
