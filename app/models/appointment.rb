class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :client

  validates :date, prensence: true
  validates :duration, prensence: true, numericality: { only_integer: true }
end
