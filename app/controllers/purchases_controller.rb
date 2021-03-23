class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: [:index, :create]
  
  def index
    @address_purchase = AddressPurchase.new
    @product = Product.find(params[:product_id])
  end
  
  def create
    
    @address_purchase = AddressPurchase.new(address_params)
    @product = Product.find(params[:product_id])
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
    end

    def pay_item
      Payjp.api_key = "sk_test_bb0e0817cda1c87008d1faa6"
      Payjp::Charge.create(
        amount: address_params[:selling_price],
        card: address_params[:token],
        currency: 'jpy'
      )
    end
end
