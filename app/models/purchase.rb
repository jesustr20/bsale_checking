class Purchase < ApplicationRecord
  self.table_name = 'purchase'

  #Associations
  has_many :boarding_passes, foreign_key: :purchase_id
end
