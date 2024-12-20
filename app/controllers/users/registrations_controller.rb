class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_guest_user, only: [:edit, :update]

  def ensure_guest_user
    if current_user.guest?
      flash[:guestout] = "ゲストユーザーはこの操作を行うことができません。"
      redirect_to root_path
    end 
  end

  protected

  def after_update_path_for(resource)
    users_show_path(current_user.id)
  end
end
