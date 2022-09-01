class Request < ApplicationRecord
  belongs_to :party
  belongs_to :user

  validates :user, uniqueness: { scope: :party,
                                message: "You already send an request!" }

  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2
  }
end
