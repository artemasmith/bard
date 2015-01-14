class WaresController < ApplicationController
  load_and_authorize_resource

  def create
    if params[:import].present?
      ware_id = Gmparser.get_product(params[:barcode])
      if ware_id.to_i > 0
        #redirect_to ware_path(ware_id)
        redirect_to rails_admin.show_path(model_name: :ware, id: ware_id)
      else
        flash[:error] = ware_id
        redirect_to rails_admin.import_path(model_name: :ware)
      end
    end
  end


end
