class ClientsController < ApplicationController
  #before_action :set_client, only: [:destroy]

  def index
  	@clients = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end