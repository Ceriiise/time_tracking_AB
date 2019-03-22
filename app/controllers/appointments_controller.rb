class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = current_user.appointments
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @client = Client.find(params[:id])
    @appointment = Appointment.new(appointment_params)
    @appointment.client = @client
    @appointment.user = current_user
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    @appointment.update(appointment_params)
    redirect_to appointment_path(@appointment)
  end

  def destroy

  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :duration)
  end

end
