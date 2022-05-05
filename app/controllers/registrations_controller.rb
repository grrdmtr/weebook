class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :gender, :email, :password, :password_confirmation, :birthdate)
  end

  def account_update_params
    params.require(:user).permit(:name, :gender, :email, :password, :password_confirmation, :current_password, :birthdate)
  end
end
