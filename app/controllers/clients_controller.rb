class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = policy_scope(Client).sort_by(&:name)
  end

  def show
    @appointments = Appointment.where(client_id: @client).sort_by(&:date)
    @appointment = Appointment.new
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
      @clients = policy_scope(Client).sort_by(&:name)
      respond_to do |format|
        format.html { redirect_to client_path(@client) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.js
      end
    end
  end

  def destroy
    @client_id = @client.id
    @client.destroy
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
