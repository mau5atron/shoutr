class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  # validates :body, presence: true, length: (1..140)
  # need to remove and move to text shout model
  validates :user, presence: true

  delegate :username, to: :user
  # method belongs to object
  # makes it possible to just use username and not 
  # specify user object when calling username object 
  # attached to user 
end
