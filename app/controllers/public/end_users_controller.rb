class Public::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to end_user_path(current_end_user)
    else
      render :edit
    end
  end

  private

  def end_user_params
    params.require(:end_user).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :phone_number)
  end
end
