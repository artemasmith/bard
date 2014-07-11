class ClientsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_client!

  def settings
  end

  def cabinet
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
