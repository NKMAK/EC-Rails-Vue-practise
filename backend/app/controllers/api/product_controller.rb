class Api::ProductController < ApplicationController
  def create
    product_params = params.require(:product).permit(
      :title, :description, :price, :stock_quantity, :active
    )
    
    product = Product.new(product_params)

    if product.save
      if params[:product][:images].present?
        params[:product][:images].each_with_index do |image, index|
          product.product_images.create(
            image: image,
            display_order: index
          )
        end
      end

      render json: {product: product, product_image: product.product_images}, status: :created  
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end
end