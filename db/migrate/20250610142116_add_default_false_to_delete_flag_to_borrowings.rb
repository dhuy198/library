class AddDefaultFalseToDeleteFlagToBorrowings < ActiveRecord::Migration[8.0]
  def change
    change_column :borrowings, :delete_flag, :boolean, default: false
  end
end
