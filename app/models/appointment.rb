class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :client

  validates :date, presence: true
  validates :duration, presence: true, numericality: { only_integer: true }
end
