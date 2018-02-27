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
  has_many :liked_shouts, through: :likes, source: :shout

  # for follows
  has_many :following_relationships, foreign_key: :follower_id
  has_many :followed_users, through: :following_relationships


  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.delete(user)
  end

  def following?(user)
    followed_user_ids.include?(user.id)
  end
  

  def like(shout)
  	liked_shouts << shout
  end

  def unlike(shout)
    liked_shouts.destroy(shout)
  end
  def liked?(shout)
  	liked_shout_ids.include?(shout.id)
  end

  def to_param
    username
  end
end
