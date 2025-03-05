class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :stock_quantity, default: 0
      t.boolean :active, default: true
      t.string :images, array: true, default: [] #本来は1対多の設計にしないといけないが練習なのでやらない
      t.timestamps
    end
    add_index :products,:title
  end
end
