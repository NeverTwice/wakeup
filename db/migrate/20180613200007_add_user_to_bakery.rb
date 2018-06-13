class AddUserToBakery < ActiveRecord::Migration[5.2]
  def change
    add_reference :bakeries, :user, foreign_key: true
  end
end
