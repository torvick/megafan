class CreateLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :description
      t.string :value
      t.timestamps
    end
  end
end
