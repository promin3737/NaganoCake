class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    if admin_signed_in?
      admin_path(resource)
    else
      customer_path(resource)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :phone_number])
  end
end
