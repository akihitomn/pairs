class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  has_many :active_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :active_relationships
  has_many :passive_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :passive_relationships

  has_many :groups, through: :groups_users
  has_many :groups_users
  has_many :messages

  def self.find_for_auth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
        )
    end

    user
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def follow(other_user)
    active_relationships.create(following_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(following_id: other_user.id).destroy
  end

  private
    def self.get_email(auth)
      email = auth.info.email
      email = "#{auth.provider}-#{auth.uid}@example.com" if email.blank?
    end
end
