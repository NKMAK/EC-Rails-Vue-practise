class CreateCarts < ActiveRecord::Migration[7.2]
  def change
    create_table :carts do |t|
      t.uuid :user_uuid
      t.decimal :total_price, precision: 10, scale: 2, default: 0
      t.boolean :active, default: true
      t.timestamps
    end
    add_index :carts, :user_uuid
    add_foreign_key  :carts, :users, column: :user_uuid, primary_key: :user_uuid
  end
end
