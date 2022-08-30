class Party < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :items
  has_many :requests

  validates :name, presence: true, length: { minimum: 5 }
  validates :date, presence: true, comparison: { greater_than_or_equal_to: date.today }
  validates :address, presence: true
  validates :status, presence: true
end
