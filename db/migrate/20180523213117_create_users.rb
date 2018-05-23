class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :email
      t.string :password
      t.string :lastname
      t.string :firstname
      t.string :phone
      t.integer :role

      t.timestamps
    end
  end
end
