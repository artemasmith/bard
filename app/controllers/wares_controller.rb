class WaresController < ApplicationController
  load_and_authorize_resource

  def index
    @wares = Ware.all
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


end
