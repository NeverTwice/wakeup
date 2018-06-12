class CreatePlannings < ActiveRecord::Migration[5.2]
  def change
    create_table :plannings do |t|
      t.integer :planning_id
      t.integer :company_id
      t.integer :day_id
      t.datetime :open_hour
      t.datetime :close_hour

      t.timestamps
    end
  end
end
