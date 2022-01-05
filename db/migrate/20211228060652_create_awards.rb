class CreateAwards < ActiveRecord::Migration[6.1]
  def change
    create_table :awards do |t|
      t.string :name
      t.string :description
      t.integer :value
      t.belongs_to :user
      t.datetime :initial_date
      t.datetime :finish_date
      t.timestamps
    end
  end
end
