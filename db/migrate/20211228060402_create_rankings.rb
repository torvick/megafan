class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.string :name
      t.string :description
      t.integer :value
      t.timestamps
    end
  end
end
