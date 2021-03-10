class Question < ApplicationRecord
  validates :title, length: { maximum: 5,maximum: 60 }
  validates :content, length: { minimum: 5,maximum: 120 }
  acts_as_votable
end
