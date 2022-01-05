class Answer < ApplicationRecord
  belongs_to :language
  belongs_to :question
end
