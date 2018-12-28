class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.float :height
      t.float :weight
      t.string :gender
      t.text :username
      t.text :password
      t.boolean :user_setting

      t.timestamps
    end
  end
end
