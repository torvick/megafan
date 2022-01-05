class Language < ApplicationRecord
  has_many :triviums
  has_many :questions
  has_many :answers
end
