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

ActiveRecord::Schema[7.0].define(version: 2023_06_30_183637) do
  create_table "eventos", force: :cascade do |t|
    t.string "eventName"
    t.string "description"
    t.time "start_time", precision: 6, null: false
    t.time "end_time", precision: 6, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.time "plazoDeTiempo", null: false
    t.date "dia", null: false
    t.index ["user_id"], name: "index_eventos_on_user_id"
  end

  create_table "reservas", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "horario", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "evento_id", null: false
    t.index ["evento_id"], name: "index_reservas_on_evento_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.integer "idcalendar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "eventos", "users"
  add_foreign_key "reservas", "eventos"
end
