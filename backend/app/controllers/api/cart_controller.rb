class Api::CartController < ApplicationController
  def add
    product_params  = params.require(:product).permit(
      :product_id, :quantity
    )
    product_id = product_params[:product_id].to_i
    quantity = product_params[:quantity].to_i || 1
    product = Product.find(product_id)
    unless product
      return render json: { success: false, text: 'Product not found' }, status: :not_found 
    end



    product_cart = @current_user.carts.find_or_create_by(active: true) # カートがなければ作成user_uuidも自動で紐づけ
    cart_item = product_cart.cart_items.find_by(product_id: product_id)


    if cart_item #update
      if product.stock_quantity < cart_item.quantity + product_params [:quantity].to_i
        return render json: { success: false, text: 'Out of stock' }, status: :unprocessable_entity
      end

      cart_item.quantity += quantity

      if cart_item.save
        return render json:{success: true, text: "quanity change"}, status: :ok
      else
        return render json: {success: false, text: cart_item.errors}, status: :unprocessable_entity
      end
    else #create
      cart_item = product_cart.cart_items.new(
        product_id: product_id,
        quantity: quantity,
        price: product.price
      )

      if cart_item.save
        return render json:{success: true, text: "new create"}, status: :ok
      else
        return render json: {success: false, text: cart_item.errors}, status: :unprocessable_entity
      end
    end
  end

  def get
    product_cart = @current_user.carts.find_by(active: true)
    if product_cart
      if product_cart.cart_items.empty?
        return render json: {cart: nil, success: true, text: "cart is empty"}, status: :ok
      end
      cart_items_with_images = product_cart.cart_items.map do |item|
        item_json = item.as_json
        item_json['product_title'] = item.product.title
        item_json['product_images'] = item.product.product_images.map do |image|
          { 
            id: image.id,
            display_order: image.display_order,
            image:{url: image.image.url} 
          }
        end
        item_json
      end
      
      render json: {
        cart: product_cart.as_json.merge(cart_items: cart_items_with_images),
        success:true
      }, status: :ok
    else
      render json: {cart: nil, success:false, text: "cart not found"}, status: :ok
    end
  end

  def delete
    cart_item_param = params.require(:cart_item).permit(:id)

    cart_item_id = cart_item_param[:id].to_i
    #ユーザテーブルから紐づいているアクティブなカートを取得してから、カートアイテムを削除する方が安全かも    
    cart_item = CartItem.find(cart_item_id)

    if cart_item.destroy
      render json: {success: true, text: "delete success"}, status: :ok
    else
      render json: {success: false, text: cart_item.errors}, status: :unprocessable_entity
    end
  end

  def purchase
    product_cart = @current_user.carts.find_by(active: true)
    if product_cart
      product_cart.active = false
      if product_cart.save
        render json: {success: true, text:"purchase"}, stattus: :ok
      else
        render json: {success: false, text: product_cart.errors}, status: :unprocessable_entity
      end
    else
      render json: {success: false, text: "cart not found"}, status: :not_found
    end
  end 
end