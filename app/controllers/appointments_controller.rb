class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:edit, :update, :destroy]
  before_action :set_client, only: [:new, :create, :edit, :update, :destroy]

  def new
    @appointment = Appointment.new
    @appointment.user = @client.user
    authorize @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.client = @client
    @appointment.user = @client.user
    upgrade_total_time
    authorize @appointment
    if @appointment.save
      @appointments = Appointment.where(client_id: @client).sort_by(&:date)
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

  def edit
    decrese_total_time
  end

  def update
    @appointment.update(appointment_params)
    upgrade_total_time
    redirect_to client_path(@client)
  end

  def destroy
    decrese_total_time
    @appointment.destroy
    redirect_to client_path(@client)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :duration)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
    authorize @appointment
  end

  def set_client
    @client = Client.find(params[:client_id])
  end

  def upgrade_total_time
    @client = Client.find(params[:client_id])
    @client.total_time += @appointment.duration.to_i
    @client.save
  end

  def decrese_total_time
    @client = Client.find(params[:client_id])
    @client.total_time -= @appointment.duration.to_i
    @client.save
  end
end
