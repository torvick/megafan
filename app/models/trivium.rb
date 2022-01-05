class Trivium < ApplicationRecord
  belongs_to :user
  belongs_to :language
  belongs_to :category
  has_many :questions
  has_many :games
  enum status: [:inactived,:actived]
end
