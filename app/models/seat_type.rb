class SeatType < ApplicationRecord
  self.table_name = 'seat_type'

  #Associations
  has_many :boarding_passes, foreign_key: :seat_type_id
  has_many :seats, foreign_key: :seat_type_id
end
