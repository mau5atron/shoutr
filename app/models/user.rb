class User < ApplicationRecord
  include Clearance::User
  validates :username, presence: true, uniqueness: true

  has_many :shouts, dependent: :destroy
  # Association for users
  # each user has many shouts (like tweets)
  # dependent destroy - added to delete all shouts when
  # user is deleted
end
