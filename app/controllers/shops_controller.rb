class ShopsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_shop, except: [:index, :create, :new]
  #before_action :check_user_tariff, only: :create

  def wares
    @wares = @shop.wares
  end

  def index
    @shops = current_user.shops
  end

  def show

  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      respond_to do |format|
        format.html { redirect_to user_shop_path(user_id: current_user.id, id: @shop.id) }
        format.xml {}
        format.js
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.xml {}
        format.js
      end
    end
  end

  def update
    if @shop.update(shop_params)
      respond_to do |format|
        format.html  { redirect_to user_shop_path(user_id: current_user.id, id: @shop.id) }
        format.xml {}
        format.js
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.xml {}
        format.js
      end
    end
  end

  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to user_shops_path(current_user) }
      format.xml {}
      format.js
    end
  end

  def edit
  end

  protected

  def shop_params
    params.require(:shop).permit(:ip, :user_id, :out_id, :address, :title)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def check_user_tariff
    current_user.shops.count == current_user.tariff.shops_count
  end
end
