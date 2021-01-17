class User < ApplicationRecord
    has_many :stories
    has_many :comments
    has_many :commented_stories, through: :comments , source: :story

end
