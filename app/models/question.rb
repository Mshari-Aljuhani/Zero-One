class Question < ApplicationRecord

  self.per_page = 5

  belongs_to :user
  has_many :comments
  validates :title, length: { minimum: 5,maximum: 60 }
  validates :content, length: { minimum: 5,maximum: 220 }
  acts_as_votable
end
