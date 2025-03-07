class CreateProductImages < ActiveRecord::Migration[7.2]
  def change
    create_table :product_images do |t|
      t.references :product
      t.string :image
      t.integer :display_order , default: 0
      t.timestamps
    end
    add_index :product_images, :product_id
  end
end
