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

  end

  def destroy

  end

  def create

  end
end
