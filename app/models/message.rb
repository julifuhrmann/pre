class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom, dependent: :destroy

  validates :message, presence: true, length: { maximum: 400 }

  def sender?(a_user)
    user.id == a_user.id
  end
end
