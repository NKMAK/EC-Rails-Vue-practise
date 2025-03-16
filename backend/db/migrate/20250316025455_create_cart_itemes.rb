class CreateCartItemes < ActiveRecord::Migration[7.2]
  def change
    create_table :cart_itemes do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, default: 1
      t.decimal :price, precision: 10, scale: 2, null: false
      t.timestamps
    end
  end
end
