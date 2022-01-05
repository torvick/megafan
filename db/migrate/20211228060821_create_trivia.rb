class CreateTrivia < ActiveRecord::Migration[6.1]
  def change
    create_table :trivia do |t|
      t.string :name
      t.datetime :initial_date
      t.datetime :finish_date
      t.belongs_to :category
      t.integer :status
      t.string :description
      t.integer :dt_h
      t.integer :dt_min
      t.belongs_to :language
      t.belongs_to :user
      t.timestamps
    end
  end
end
