class BoardingPass < ApplicationRecord
  self.table_name = 'boarding_pass'

  # Relationships
  belongs_to :flight, foreign_key: :flight_id
  belongs_to :passenger, foreign_key: :passenger_id
  belongs_to :purchase, foreign_key: :purchase_id
  belongs_to :seat_type, foreign_key: :seat_type_id
  has_many :seats, foreign_key: :seat_id
end
