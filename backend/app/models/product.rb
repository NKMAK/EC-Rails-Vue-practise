class Product < ApplicationRecord
  has_many :product_images, dependent: :destroy
  has_many :cart_items, dependent: :nullify
end
