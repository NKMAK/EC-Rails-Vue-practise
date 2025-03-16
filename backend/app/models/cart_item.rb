class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  after_save :update_cart_total

  def update_cart_total
    cart.update(total_price: cart.total)
  end
end
