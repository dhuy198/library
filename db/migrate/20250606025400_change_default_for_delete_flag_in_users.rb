class ChangeDefaultForDeleteFlagInUsers < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :delete_flag, from: nil, to: false
  end
end
