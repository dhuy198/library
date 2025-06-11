class ChangeDefaultForDeleteFlagInBooks < ActiveRecord::Migration[8.0]
  def change
    change_column_default :books, :delete_flag, from: nil, to: false

  end
end
