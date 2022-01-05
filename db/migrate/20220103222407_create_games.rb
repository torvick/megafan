class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.belongs_to :trivium
      t.belongs_to :client
      t.integer :status
      t.integer :corrects
      t.integer :incorrects
      t.string :time_gamed
      t.boolean :winner
      t.timestamps
    end
  end
end
