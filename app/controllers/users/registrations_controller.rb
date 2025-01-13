class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_guest_user, only: [:edit, :update]

  def ensure_guest_user
    if current_user.guest?
      redirect_to root_path, notice: 'ゲストユーザーはこの操作を行うことができません。'
    end
  end

  protected

  def after_update_path_for(resource)
    users_show_path(current_user.id)
  end
end
