class Party < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :items
  has_many :requests
  has_many :favorites
end
