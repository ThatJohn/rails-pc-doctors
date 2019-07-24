class ClientsController < ApplicationController
  before_action :find_client, only: [:show, :destroy, :edit, :update]

  def index
    @clients = Client.all
  end

  def show
    @orders = @client.work_orders
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.create(client_params)
    redirect_to clients_path
  end

  def update
    @client.update(client_params)
    redirect_to clients_path
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  private

  def find_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name)
  end
end
