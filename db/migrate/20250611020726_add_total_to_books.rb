class AddTotalToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :total, :integer, default: 0
  end
end
