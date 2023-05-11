class Passenger < ApplicationRecord
  self.table_name = 'passenger'

  #Associations
  has_many :boarding_passes, foreign_key: :passenger_id
  has_many :purchases, through: :boarding_passes
  has_many :seat_types, through: :boarding_passes
  has_many :seats, through: :boarding_passes
end
