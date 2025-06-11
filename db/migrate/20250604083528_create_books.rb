class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :image
      t.string :subtitle
      t.references :author, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.integer :publishing_year
      t.integer :quantity_in_stock
      t.string :description
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
