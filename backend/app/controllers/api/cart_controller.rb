class Api::CartController < ApplicationController
  def add
    product_params  = params.require(:product).permit(
      :product_id, :quantity
    )
    product_id = product_params[:product_id].to_i
    quantity = product_params[:quantity].to_i || 1
    product = Product.find(product_id)
    unless product
      return render json: { sucess: false, text: 'Product not found' }, status: :not_found 
    end



    product_cart = @current_user.carts.find_or_create_by(active: true) # カートがなければ作成user_uuidも自動で紐づけ
    cart_item = product_cart.cart_items.find_by(product_id: product_id)


    if cart_item #update
      if product.stock_quantity < cart_item.quantity + product_params [:quantity].to_i
        return render json: { sucess: false, text: 'Out of stock' }, status: :unprocessable_entity
      end

      cart_item.quantity += quantity

      if cart_item.save
        return render json:{sucess: true, text: "quanity change"}, status: :ok
      else
        return render json: {sucess: false, text: cart_item.errors}, status: :unprocessable_entity
      end
    else #create
      cart_item = product_cart.cart_items.new(
        product_id: product_id,
        quantity: quantity,
        price: product.price
      )

      if cart_item.save
        return render json:{sucess: true, text: "new create"}, status: :ok
      else
        return render json: {sucess: false, text: cart_item.errors}, status: :unprocessable_entity
      end
    end
  end

  def get
    product_cart = @current_user.carts.find_by(active: true)
    if product_cart
      render json:{cart: product_cart.as_json(include: :cart_items)}, status: :ok
    else
      render json: {cart: nil}, status: :ok
    end
  end
end