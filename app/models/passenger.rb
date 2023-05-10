class Passenger < ApplicationRecord
  self.table_name = 'passenger'

  # Relationships
  has_many :boarding_passes, foreign_key: :passenger_id
end
