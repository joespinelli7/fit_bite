class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :calories_burned
      t.integer :mins_active

      t.timestamps
    end
  end
end
