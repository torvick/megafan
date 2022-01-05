class CreateBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :balances do |t|
      t.decimal :available, default: 0
      t.decimal :total, default: 0
      t.belongs_to :type_balance
      t.belongs_to :client
      t.timestamps
    end
  end
end
