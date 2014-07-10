class WaresController < ApplicationController
  before_action :set_shop
  before_action :set_ware, except: [:index, :new, :create]
  def index
    @wares = @shop.wares
    @allwares = Ware.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  protected

  def set_shop
    id = params[:shop_id] || params[:ware][:shop_id]
    @shop = Shop.find(id.to_i)
  end

  def set_ware
    @ware = @shop.wares.find(params[:id])
  end
end
