class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    # @clients = Client.all.sort_by(&:name)
    @clients = policy_scope(Client).sort_by(&:name)
  end

  def show
    @appointments = Appointment.where(client_id: @client).sort_by(&:date)
  end

  def new
    @client = Client.new
    authorize @client
  end

  def create
    @client = Client.new(client_params)
    @client.user = current_user
    @client.total_time = 0
    authorize @client
    if @client.save!
      redirect_to client_path(@client)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    # Client.update(client_params)
    # redirect_to clients_path
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  private

  def set_client
    @client = Client.find(params[:id])
    authorize @client
  end

  def client_params
    params.require(:client).permit(:name, :total_time)
  end
end
