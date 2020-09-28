class UsersController < ApplicationController
  def profile
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :avatar)
  end

end
