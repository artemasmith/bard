class ShopsController < ApplicationController
  before_action :set_shop, except: [:index, :create, :new]
  before_action :new_shop, only: :create
  load_and_authorize_resource
  before_action :authenticate_user!


  def index
    @shops = current_user.shops
  end

  def show

  end

  def new
    @shop ||= Shop.new
  end

  def create
    #@shop = current_user.shops.new(shop_params)
    if @shop.save
      respond_to do |format|
        format.html { redirect_to user_shop_path(user_id: current_user.id, id: @shop.id) }
      end
    else
      render :new
    end
  end

  def update
    if @shop.update(shop_params)
      respond_to do |format|
        format.html  { redirect_to user_shop_path(user_id: current_user.id, id: @shop.id) }
      end
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to user_shops_path(current_user) }
    end
  end

  def edit
  end

  def get_token
    respond_to :js
  end

  protected

  def shop_params
    params.require(:shop).permit(:ip, :address, :title, :user_id)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def new_shop
    @shop = Shop.new(shop_params)
  end

end
