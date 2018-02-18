class Shout < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: (1..140)
  validates :user, presence: true
end
