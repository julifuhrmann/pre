class Party < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :items
  has_many :requests
  has_one_attached :photo

  validates :name, presence: true, length: { minimum: 5 }
  validates :date, presence: true, comparison: { greater_than_or_equal_to: Date.today }
  validates :address, presence: true
  validates :status, presence: true

  enum status: {
    restrict: 0,
    open: 1
  }

  def self.top_three
    @parties = Party.last(3)
  end
end
