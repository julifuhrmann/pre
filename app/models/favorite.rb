class Favorite < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :user, uniqueness: { scope: :party,
                                  message: "You already favorited this person!" }
end
