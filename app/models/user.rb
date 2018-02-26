class User < ApplicationRecord
  include Clearance::User
  validates :username, presence: true, uniqueness: true

  has_many :shouts, dependent: :destroy
  # Association for users
  # each user has many shouts (like tweets)
  # dependent destroy - added to delete all shouts when
  # user is deletedr

  # user has many like and liked shouts
  has_many :likes
  has_many :liked_shouts, :through: :likes, source: :shout

  def like(shout)
  	liked_shouts << shout
  end
end
