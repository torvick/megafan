class CreateSocialNetworks < ActiveRecord::Migration[6.1]
  def change
    create_table :social_networks do |t|
      t.string :name
      t.integer :sc_key
      t.string :sn_id
      t.belongs_to :client
      t.timestamps
    end
  end
end
