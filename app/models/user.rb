class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :favorites_as_follower, class_name: "Favorite", foreign_key: :follower_id
  has_many :favorites_as_followed, class_name: "Favorite", foreign_key: :followed_id
  has_many :parties
  has_many :reviews
  has_many :items
  has_many :messages
  has_one_attached :avatar


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
