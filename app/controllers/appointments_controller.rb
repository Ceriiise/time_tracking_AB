class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:show, :edit, :update, :new, :create, :destroy]

  def index
    @appointments = current_user.appointments
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.client = @client
    @appointment.user = current_user
    upgrade_total_time
    if @appointment.save
      redirect_to client_path(@client)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    upgrade_total_time
    @appointment.update(appointment_params)
    redirect_to client_path(@client)
  end

  def destroy
    decrese_total_time
    @appointment.destroy
    redirect_to client_path(@client)
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

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_client
    @client = Client.find(params[:client_id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :duration)
  end

end
