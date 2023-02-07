class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :gender, :email, :password, :password_confirmation, :birthday)
  end

  def account_update_params
    params.require(:user).permit(:name, :gender, :email, :password, :password_confirmation, :current_password, :birthday)
  end
end
