class BarcodesController < ApplicationController
  load_and_authorize_resource
  def index
    @barcodes = Barcode.all
    #@barcodes= @barcodes.paginate(params[:page])    
  end

  def new
  end

  def create
    @barcode = Barcode.new
    attributes = [:number, :id_ware]
    attributes.each { |a|  @barcode[a] = params[:barcode][a] }
    @barcode.save
    respond_to do |format|
      format.html { redirect_to barcodes_path }
      format.xml { render xml: @barcode.to_xml }
    end
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def show
    @barcode=Barcode.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render  xml: @barcode }
      format.json { render json: @barcode.to_json }
    end
  end
end
