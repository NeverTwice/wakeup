class CreatePlannings < ActiveRecord::Migration[5.2]
  def change
    create_table :plannings do |t|
      t.datetime :open_hour
      t.datetime :close_hour
      t.references :bakery, foreign_key: true
      t.references :week, foreign_key: true

      t.timestamps
    end
  end
end
