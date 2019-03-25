class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def calendar
    today = Date.today
    @days_from_this_week = (today.at_beginning_of_week..today.at_end_of_week).map
    @appointments = Appointment.where(user_id: current_user, date: today.at_beginning_of_week..today.at_end_of_week)
  end
end
