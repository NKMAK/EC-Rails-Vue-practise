class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product, foreign_key: 'product_id', primary_key: 'id'

  after_save :update_cart_total
  after_destroy :update_cart_total

  def update_cart_total
    cart.update(total_price: cart.total)
  end
end
