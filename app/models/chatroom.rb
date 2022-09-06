class Chatroom < ApplicationRecord
  belongs_to :sender, :class_name => "User"
  belongs_to :receiver, :class_name => "User"
  has_many :messages

  validates :sender_id, uniqueness: { scope: :receiver_id,
        message: "Chatroom already created, can't create a new one" }
end
