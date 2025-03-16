class Cart < ApplicationRecord
  has_many :cart_items

  def total
    cart_items.sum { |item| item.price_at_addition * item.quantity }
  end
end
