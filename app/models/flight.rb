class Flight < ApplicationRecord
  self.table_name = 'flight'

  #Associations
  has_many :boarding_passes, foreign_key: :flight_id
  has_many :passengers, through: :boarding_passes

  belongs_to :airplane, foreign_key: :airplane_id
end
