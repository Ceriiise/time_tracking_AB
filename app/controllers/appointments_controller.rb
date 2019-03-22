class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:show, :new, :create, :destroy]

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
    update_total_time
    if @appointment.save
      redirect_to client_appointments_path(@client)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    update_total_time
    @appointment.update(appointment_params)
    redirect_to appointment_path(@appointment)
  end

  def destroy
    @appointment.destroy
    redirect_to client_appointments_path(@client)
  end

  def update_total_time
    @client = Client.find(params[:client_id])
    @client.total_time += @appointment.duration.to_i
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_client
    @client = client.appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :duration)
  end

end
