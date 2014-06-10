class UsersController < ApplicationController
  before_action :authenticate_user!

  def settings
    @tariff = current_user.tariff
    @user = current_user
  end

  def cabinet
    @tariff = current_user.tariff
  end

  def stats
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to cabinet_user_path(@user)
    else
      render 'settings'
    end
  end

  def destroy

  end

  def create

  end

  def user_params
    params.require(:user).permit(:name, :email, :specs, :password, :password_confirmation)
  end
end
