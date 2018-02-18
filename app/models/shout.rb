class Shout < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: (1..140)
  validates :user, presence: true

  delegate :username, to: :user
  # method belongs to object
  # makes it possible to just use username and not 
  # specify user object when calling username object 
  # attached to user 
end
