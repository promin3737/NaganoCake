class Public::AddressesController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @addresses = current_end_user.addresses
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address = current_end_user.addresses.find(params[:id])
  end

  def update
    @address = current_end_user.addresses.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = current_end_user.addresses.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :address, :postal_code)
  end
end
