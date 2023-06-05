# frozen_string_literal: true
class BoardingPassesSerializer < Blueprinter::Base
  identifier :id, name: :boardingPassId
  field :purchase_id, name: :purchaseId
  field :seat_type_id, name: :seatTypeId
  field :seat_id, name: :seatId
end