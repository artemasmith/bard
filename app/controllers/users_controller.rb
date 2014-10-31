class UsersController < ApplicationController
  before_action :authenticate_user!

  def settings
    @user = User.find(current_user.id)
    @tariff = @user.tariff
  end

  def cabinet
    @tariff = current_user.tariff
  end

  def stats
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) && @user.errors.blank?
      redirect_to cabinet_user_path(@user)
    else
      render 'settings'
    end
  end

  def update_tariff
    @user = User.find(params[:id].to_i)
    if params[:tariff_id].present?
      @msg = @user.update_tariff(params[:tariff_id].to_i)
    end

    render 'settings'
  end

  def destroy

  end

  def create

  end

  def user_params
    params.require(:user).permit(:name, :email, :specs, :password, :password_confirmation, :login)
  end
end
