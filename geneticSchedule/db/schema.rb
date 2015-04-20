# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150415002138) do

  create_table "cargos", force: true do |t|
    t.string   "cups"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultorios", force: true do |t|
    t.string   "numero"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "out_put_solutions", force: true do |t|
    t.string   "monday"
    t.string   "tuesday"
    t.string   "wenesday"
    t.string   "thursday"
    t.string   "friday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_cargo_works", force: true do |t|
    t.integer  "user_id"
    t.integer  "cargo_id"
    t.string   "estado",     limit: 1
    t.string   "monday"
    t.string   "tuesday"
    t.string   "wednesday"
    t.string   "thursday"
    t.string   "friday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "cc"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "perfil"
    t.string   "telefono"
    t.string   "direccion"
    t.string   "especialidad"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
