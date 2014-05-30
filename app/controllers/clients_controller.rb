class ClientsController < ApplicationController
  before_action :authenticate_client!

  def settings
  end

  def cabinet
    @client = current_client
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
