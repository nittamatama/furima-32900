class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: [:index, :create]
  before_action :same_method, only: [:index, :create]
  
  def index
    @address_purchase = AddressPurchase.new
  end
  
  def create
    @address_purchase = AddressPurchase.new(address_params)
    if @address_purchase.valid?
       pay_item
       @address_purchase.save
       redirect_to root_path
    else
      render action: :index
    end
  end
  
    private
    def address_params
      params.require(:address_purchase).permit(:postal_code, :city, :address, :building_name, :prefecture_id, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id]).merge(token: params[:token])
    end

    def move_to_index
      @user = Product.find(params[:product_id])
      if @user.user_id == current_user.id
         redirect_to root_path
      end
      
      @product = Product.find(params[:product_id])
      if @product.purchase.present?
        redirect_to root_path
      end
    end

    def same_method
      @product = Product.find(params[:product_id])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.selling_price,
        card: address_params[:token],
        currency: 'jpy'
      )
    end
end

