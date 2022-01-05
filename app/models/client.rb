class Client < ApplicationRecord
  has_secure_password
  has_many :balances
  has_many :social_networks
  has_many :games
  belongs_to :country
  belongs_to :ranking
  belongs_to :role

  enum gender: [:female,:male,:other]
end