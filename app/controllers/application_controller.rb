class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user

  private

  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in', notice: 'ログインしてください。'
    end
  end

  def set_user
    @user = current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
