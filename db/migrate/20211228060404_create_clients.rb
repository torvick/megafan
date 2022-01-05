class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :mdd_name
      t.string :lt_name
      t.string :sc_lt_name
      t.string :display_name
      t.integer :gender
      t.date :dob
      t.string :phone
      t.string :avatar
      t.string :email
      t.string :password_digest
      t.datetime :last_sign_in_at, default: Time.now
      t.integer :sign_in_count, default: 0
      t.belongs_to :role
      t.belongs_to :country
      t.belongs_to :ranking
      t.timestamps
    end
  end
  
end
