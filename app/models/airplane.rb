class Airplane < ApplicationRecord
  self.table_name = 'airplane'

  #Associations
  has_many :seats, foreign_key: :airplane_id
  has_many :flights, foreign_key: :airplane_id
end
