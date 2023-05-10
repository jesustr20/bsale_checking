# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 0) do
  create_table "airplane", primary_key: "airplane_id", id: { type: :integer, comment: "Identificador de la tabla" }, charset: "latin1", force: :cascade do |t|
    t.string "name", null: false, comment: "Nombre del avión"
  end

  create_table "boarding_pass", primary_key: "boarding_pass_id", id: { type: :integer, comment: "Identificador de la tabla" }, charset: "latin1", force: :cascade do |t|
    t.integer "purchase_id", null: false, comment: "Id de la compra"
    t.integer "passenger_id", null: false, comment: "Id del pasajero"
    t.integer "seat_type_id", null: false, comment: "Id del tipo de asiento"
    t.integer "seat_id", comment: "Id del asiento"
    t.integer "flight_id", null: false, comment: "Id del vuelo"
    t.index ["flight_id"], name: "flight_id_bp"
    t.index ["passenger_id"], name: "passenger_id_bp"
    t.index ["purchase_id"], name: "purchase_id_bp"
    t.index ["seat_id"], name: "seat_id_bp"
    t.index ["seat_type_id"], name: "seat_type_id_bp"
  end

  create_table "flight", primary_key: "flight_id", id: { type: :integer, comment: "Identificador de la tabla" }, charset: "latin1", force: :cascade do |t|
    t.integer "takeoff_date_time", null: false, comment: "Fecha y hora del despegue"
    t.string "takeoff_airport", null: false, comment: "Aeropuerto de despegue"
    t.integer "landing_date_time", null: false, comment: "Fecha y hora de aterrizaje"
    t.string "landing_airport", null: false, comment: "Aeropuerto de aterrizaje"
    t.integer "airplane_id", null: false, comment: "Id del avión"
    t.index ["airplane_id"], name: "airplane_id_fl"
  end

  create_table "passenger", primary_key: "passenger_id", id: { type: :integer, comment: "Identificador de la tabla" }, charset: "latin1", force: :cascade do |t|
    t.string "dni", null: false, comment: "Número de identificación del pasajero"
    t.string "name", null: false, comment: "Nombre completo del pasajero"
    t.integer "age", null: false, comment: "Edad del pasajero"
    t.string "country", null: false, comment: "País del pasajero"
  end

  create_table "purchase", primary_key: "purchase_id", id: { type: :integer, comment: "Identificador de la tabla" }, charset: "latin1", force: :cascade do |t|
    t.integer "purchase_date", null: false, comment: "Fecha de la compra"
  end

  create_table "seat", primary_key: "seat_id", id: { type: :integer, comment: "Identificador de la tabla" }, charset: "latin1", force: :cascade do |t|
    t.string "seat_column", limit: 2, null: false, comment: "Columna del asiento"
    t.integer "seat_row", null: false, comment: "Fila del asiento"
    t.integer "seat_type_id", null: false, comment: "Id del tipo de asiento {FK}"
    t.integer "airplane_id", null: false, comment: "Id del avión al que pertenece el asiento"
    t.index ["airplane_id"], name: "airplane_id_se"
    t.index ["seat_type_id"], name: "seat_type_id_se"
  end

  create_table "seat_type", primary_key: "seat_type_id", id: { type: :integer, comment: "Identificador de la tabla" }, charset: "latin1", force: :cascade do |t|
    t.string "name", null: false, comment: "Nombre del tipo de asiento"
  end

  add_foreign_key "boarding_pass", "flight", primary_key: "flight_id", name: "flight_id_bp", on_delete: :cascade
  add_foreign_key "boarding_pass", "passenger", primary_key: "passenger_id", name: "passenger_id_bp", on_delete: :cascade
  add_foreign_key "boarding_pass", "purchase", primary_key: "purchase_id", name: "purchase_id_bp", on_delete: :cascade
  add_foreign_key "boarding_pass", "seat", primary_key: "seat_id", name: "seat_id_bp", on_delete: :cascade
  add_foreign_key "boarding_pass", "seat_type", primary_key: "seat_type_id", name: "seat_type_id_bp", on_delete: :cascade
  add_foreign_key "flight", "airplane", primary_key: "airplane_id", name: "airplane_id_fl", on_delete: :cascade
  add_foreign_key "seat", "airplane", primary_key: "airplane_id", name: "airplane_id_se", on_delete: :cascade
  add_foreign_key "seat", "seat_type", primary_key: "seat_type_id", name: "seat_type_id_se", on_delete: :cascade
end
