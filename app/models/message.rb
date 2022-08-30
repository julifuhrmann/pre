class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :message, presence: true, length: { maximum: 400 }
end
