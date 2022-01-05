class Balance < ApplicationRecord
  belongs_to :client
  belongs_to :type_balance
end
