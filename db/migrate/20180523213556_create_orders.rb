class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.integer :user_id
      t.integer :address_id

      t.timestamps
    end
  end
end
