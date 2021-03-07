class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # @products = Product.all
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
   end

  private

  def product_params
    params.require(:product).permit(:product_name, :description, :selling_price, :category_id, :condition_id, :delivery_fee_id, :delivery_period_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end
end
