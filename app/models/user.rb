class User < ApplicationRecord
  has_many :pictureposts
  has_many :comments
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  #Facebook認証
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.new(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        name:  auth.info.name,
        password: Devise.friendly_token[0, 20],
      )
      user.save(:validate => false)
    end
    user
  end

  #ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end
  #フォローを解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  #現在のユーザーがフォローしてるかどうか
  def following?(other_user)
    following.include?(other_user)
  end

  #フォローしているユーザーの投稿と自分自身の投稿すべてを取得 トップページのフィード
  def feed
    following_ids = "SELECT followed_id FROM relationships
    WHERE follower_id = :user_id"
    Picturepost.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end
end
