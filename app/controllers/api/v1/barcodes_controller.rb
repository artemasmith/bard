class Api::V1::BarcodesController < ApplicationController
  respond_to :json
  before_action :restrict_access
  before_action :observe_ware_traverse

  #send to client all his wares
  def index
    result = @shop.get_wares 'ALL'
    render json: result.to_json
  end

  def show
    #render json: { errors: 'no barcode provided' }, status: 400 if params[:barcode].blank?
    if params[:barcodes].present?
      result = @shop.get_wares params[:barcodes]
      render json: result.to_json
    else
      render json: { errors: 'no barcode provided' }, status: 400
    end
  end

  def create
    if params[:wares].present?
      wares = JSON(params[:wares])
      wares['shop_id'] = @shop.id
      result = UnvalidatedWare.create_by_request wares.to_json
      render json: result
    else
      render json: { errors: 'no wares provided' }, status: 400
    end
  end

  private

  def restrict_access
    if params[:login].blank? || params[:auth_token].blank?
      #head :unauthorized, error_message: "wrong request, no login or auth token provided"
      render json: { error_message: 'wrong request, no login or auth token or barcodes provided' }, status: 401
      return
    end
    @client = User.find_by_login(params[:login])
    if @client.blank?
      #head :unauthorized, error_message: "no such client - wrong login"
      render json: { error_message: 'wrong login' }, status: 401
      return
    end
    @shop = @client.shops.where("ip = ? OR auth_token = ?", request.remote_ip, params[:auth_token]).first
    @shop = nil if @shop.present? && @shop.auth_token != params[:auth_token]

    if @shop.blank?
      render json: { error_message: 'there is no shop indetified by this token or ip' }
      return
    end
    token = @shop.get_token
    if token.length != 32
      #head :unauthorized, error_message: "#{token}"
      render json: { error_message: "#{token}" }
      return
    end
  end

  def observe_ware_traverse
    #TODO build observer logic of filling operation log.
    true
  end
end