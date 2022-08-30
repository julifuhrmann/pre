class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :party
  validates :user, uniqueness: { scope: :party,
                                message: "You already favorite this person!" }
end
