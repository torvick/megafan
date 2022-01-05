class Question < ApplicationRecord
  belongs_to :language
  has_many :answers
  belongs_to :trivium
end
