class CreateBorrowings < ActiveRecord::Migration[8.0]
  def change
    create_table :borrowings do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at
      t.datetime :actual_end_at
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
