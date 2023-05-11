class Seat < ApplicationRecord
  self.table_name = 'seat'

  #Associations
  belongs_to :boarding_pass, foreign_key: :seat_id
  belongs_to :seat_type, foreign_key: :seat_type_id
  belongs_to :airplane, foreign_key: :airplane_id
end
