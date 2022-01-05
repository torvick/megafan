class ClientsController < ApplicationController

  before_action :set_client, only: [:show,:edit,:update]

  def index
    @title = t('sidebar.clients.list')
    @clients = Client.all
  end

  def show
    @title = t('sidebar.clients.show')
  end

  def update
    if @client.update(client_params)
      flash[:notice] = t('clients.update.success')
      render 'show'
    else
      flash[:notice] = t('clients.update.error')
      render 'edit'
    end
  end

  def edit
    @title = t('sidebar.clients.edit')
  end

  private

    def set_client
      @client = Client.find_by(id: params[:id])
    end

    def client_params
      params.require(:clients).permit(:name, :mdd_name, :email,:phone,:lt_name,:sc_lt_name,:display_name)
    end
end
