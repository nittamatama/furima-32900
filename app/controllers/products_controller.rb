class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  
  def index
    @products = Product.all.order(created_at: :DESC)
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

   def show
   end

   def edit
   end

   def update
     if @product.update(product_params)
        redirect_to product_path
     else
       render :edit
     end
   end

   def destroy
    if @product.destroy
       redirect_to root_path
    else
      render :edit
    end
   end

  private

  def product_params
    params.require(:product).permit(:product_name, :description, :selling_price, :category_id, :condition_id, :delivery_fee_id, :delivery_period_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if @product.user_id != current_user.id || @product.purchase.present?
       redirect_to action: :index
    end
  end
  
  def set_product
    @product = Product.find(params[:id])
  end
end
