class UnvalidatedWaresController < ApplicationController
  before_action :set_uware, except: [:index, :create, :new]

  load_and_authorize_resource :except => :create
  before_action :authenticate_user!

  def index
    @uwares = current_user.unvalidated_wares
  end

  def show
  end

  def new
    @uware ||= UnvalidatedWare.new
  end

  def edit
  end

  def create
    @uware = UnvalidatedWare.new(uware_params)
    authorize! :create, @uware
    if @uware.save
      respond_to do |format|
        format.html { redirect_to user_unvalidated_ware_path(user_id: current_user.id, id: @uware.id) }
      end
    else
      render :new
    end
  end

  def update
    if @uware.update(uware_params)
      respond_to do |format|
        format.html  { redirect_to user_unvalidated_ware_path(user_id: current_user.id, id: @uware.id) }
      end
    else
      render :edit
    end
  end

  def destroy
    @uware.destroy
    respond_to do |format|
      format.html { redirect_to user_unvalidated_ware_path(current_user) }
    end
  end

  protected

  def uware_params
    params.require(:unvalidated_ware).permit(:barcode, :title, :comment, :user_id)
  end

  def set_uware
    @uware = UnvalidatedWare.find(params[:id])
  end

end
