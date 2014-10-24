class Api::V1::BarcodesController < ApplicationController
  respond_to :json
  before_action :restrict_access

  #send to client all his wares
  def index
    #@shop.wares.all.to_json
    render json: @shop.wares.all.to_json, status: 200
  end

  def show
    result = { 'unrecognized_wares' => [], 'characteristics' => [], 'wares' => [], 'properties' => [], 'categories' =>
    [], 'values' => [] }
    barcodes = params['barcodes'].split(',')
    barcodes.each do |b|
      tb = Barcode.find_by_number(b)
      ware = tb.try :ware
      if tb.present? && ware.present?
        if ware.characteristics.present?
          ware.characteristics.each do |c|
            temp1 = JSON(c.to_json)
            temp1['ware_id'] = ware.id
            result['characteristics'] << temp1
          end
        end
        temp = JSON(ware.to_json)
        temp['barcode'] = tb.number
        result['wares'] << temp
      else
        result['unrecognized_wares'] << b.to_json
      end
    end
    Property.all.each { |p| result['properties'] << JSON(p.to_json) }
    Category.all.each { |c| result['categories'] << JSON(c.to_json) }
    Value.all.each { |v| result['values'] << JSON(v.to_json) }
    render json: result.to_json
  end

  def create

  end

  private

  def restrict_access
    if params[:login].blank? || params[:auth_token].blank?
      #head :unauthorized, error_message: "wrong request, no login or auth token provided"
      render json: { error_message: 'wrong request, no login or auth token provided' }, status: 401 if params[:login].blank? || params[:auth_token].blank?
      return
    end
    @client = User.find_by_login(params[:login])
    if @client.blank?
      #head :unauthorized, error_message: "no such client - wrong login"
      render json: { error_message: 'wrong login' }, status: 401 if @client.blank?
      return
    end
    @shop = @client.shops.where("ip = ? OR auth_token = ?", request.remote_ip, params[:auth_token]).first
    @shop = nil if @shop.present? && @shop.auth_token != params[:auth_token]

    if @shop.blank?
      render json: { error_message: 'there is no shop indetified by this token or ip' } if @shop.blank?
      return
    end
    token = @shop.get_token
    if token.length != 32
      #head :unauthorized, error_message: "#{token}"
      render json: { error_message: "#{token}" } if token.length != 32
      return
    end
  end
end