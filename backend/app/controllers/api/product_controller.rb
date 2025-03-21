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

  def get
    product_params = params.require(:product).permit(:limit,:offset)
    limit = product_params[:limit].to_i
    offset = product_params[:offset].to_i

    product_total_num = Product.where(active: true).count
    product_data = Product.where(active: true).includes(:product_images).order(created_at: :desc).offset(offset).limit(limit)

    render json: {  product_data: product_data.as_json(include: :product_images) , total: product_total_num }, status: 200
  end

  def one_get
    product_id = params[:id] 
    id = product_id.to_i
    product_data = Product.where(active: true).includes(:product_images).find_by(id: id)

    render json: product_data.as_json(include: :product_images) , status: 200
  end
end