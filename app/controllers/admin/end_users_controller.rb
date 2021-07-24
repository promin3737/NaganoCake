class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
  end

  def edit
  end

  def show
  end

  def update
  end

  private

  def end_user_params
    params.require(:end_user).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :is_status, :postal_code, :address, :phone_number)
  end
end
