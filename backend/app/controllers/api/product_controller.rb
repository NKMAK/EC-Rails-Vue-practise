class Api::ProductController < ApplicationController
  def create
    product_params =  params.require(:product).permit(
      :title, :description, :price, :stock_quantity,images: []
    )
    product = Product.new(product_params)

    if product.save
      render json: product, status: :created  
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end
end