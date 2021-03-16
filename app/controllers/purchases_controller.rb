class PurchasesController < ApplicationController
  def index
    @address_purchase = AddressPurchase.new
  end
  
  def create
    @address_purchase = AddressPurchase.new(address_params)
    if @address_purchase.valid?
       @address_purchase.save
       redirect_to root_path
    else
      render action: :index
    end
  end
  
    private
    def address_params
      params.require(:address_purchase).permit(:postal_code, :city, :address, :building_name, :prefecture_id, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], purchase_id: params[:purchase_id])
    end
end
