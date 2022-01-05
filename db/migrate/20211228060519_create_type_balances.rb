class CreateTypeBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :type_balances do |t|
      t.string :name
      t.string :description
      t.integer :value
      t.timestamps
    end
  end
end
