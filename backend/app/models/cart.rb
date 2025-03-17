class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user, foreign_key: 'user_uuid', primary_key: 'user_uuid'

  def total
    cart_items.sum { |item| item.price * item.quantity }
  end
end
