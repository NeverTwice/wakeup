class CreateOrderStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :order_statuses do |t|
      t.integer :status_id
      t.references :order, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
