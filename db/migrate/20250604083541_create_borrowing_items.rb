class CreateBorrowingItems < ActiveRecord::Migration[8.0]
  def change
    create_table :borrowing_items do |t|
      t.references :borrowing, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :quantity
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
