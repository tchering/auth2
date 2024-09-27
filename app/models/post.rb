class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 5, maximum: 50 }
end
