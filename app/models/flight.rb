class Flight < ApplicationRecord
  self.table_name = 'flight'

  #Relationships
  has_many :boarding_passes, foreign_key: :flight_id
  has_many :passengers, through: :boarding_passes
end
