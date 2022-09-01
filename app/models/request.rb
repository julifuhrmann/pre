class Request < ApplicationRecord
  belongs_to :party
  belongs_to :user

  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2
  }
end
