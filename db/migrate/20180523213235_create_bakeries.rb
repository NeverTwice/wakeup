class CreateBakeries < ActiveRecord::Migration[5.2]
  def change
    create_table :bakeries do |t|
      t.integer :bakery_id
      t.string :company_name
      t.string :picture

      t.timestamps
    end
  end
end
