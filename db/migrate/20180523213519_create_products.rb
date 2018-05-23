class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :product_id
      t.integer :company_id
      t.string :picture
      t.string :description
      t.string :name
      t.float :price
      t.integer :quantity
      t.integer :category_id

      t.timestamps
    end
  end
end
