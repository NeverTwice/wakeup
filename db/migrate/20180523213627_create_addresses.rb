class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :address_id
      t.integer :user_id
      t.string :address
      t.string :zipcode
      t.string :country

      t.timestamps
    end
  end
end
