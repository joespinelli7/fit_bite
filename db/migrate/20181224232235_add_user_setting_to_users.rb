class AddUserSettingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_setting, :boolean
  end
end
