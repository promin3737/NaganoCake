class Public::CustomersController < ApplicationController
  def show
    @end_user = EndUser.find(params[:id])
  end

  private

  def end_user_params
    params.require(:end_user).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :phone_number)
  end
end
