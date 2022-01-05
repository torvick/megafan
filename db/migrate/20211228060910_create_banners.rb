class CreateBanners < ActiveRecord::Migration[6.1]
  def change
    create_table :banners do |t|
      t.string :name
      t.string :text_alternative
      t.string :credits
      t.datetime :initial_date
      t.datetime :finish_date
      t.string :image
      t.timestamps
    end
  end
end
