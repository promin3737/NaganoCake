class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!

  def mypage
    @end_user = current_end_user
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = current_end_user
    if @end_user.update(end_user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to end_user_mypage_path
    else
      render :edit
    end
  end

  def confirm
  end

  def withdraw
    @end_user = current_end_user
    if @end_user.update(is_status: false)
      reset_session
      flash[:notice]="You have updated user successfully."
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def end_user_params
    params.require(:end_user).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :is_status, :postal_code, :address, :phone_number)
  end
end
