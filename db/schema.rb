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

ActiveRecord::Schema.define(version: 20151202185131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "estado"
  end

  create_table "couches", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "pais"
    t.string   "provincia"
    t.string   "ciudad"
    t.integer  "capacidad"
    t.boolean  "ocupado"
    t.text     "url"
  end

  create_table "earns", force: :cascade do |t|
    t.date     "fech_ing"
    t.date     "fech_egr"
    t.float    "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.text     "url"
    t.integer  "couch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.float    "amount"
    t.integer  "responseCode"
    t.string   "responseMessage"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "couch_id"
    t.integer  "user_id"
    t.date     "fech_ing"
    t.date     "fech_egr"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "confirmacion"
    t.boolean  "valorar"
    t.boolean  "valorar_user"
    t.boolean  "pendiente"
  end

  create_table "searches", force: :cascade do |t|
    t.string   "tipo"
    t.string   "contenido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "tipo2"
    t.string   "tipo3"
    t.string   "contenido2"
    t.string   "contenido3"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "apellido"
    t.date     "nacimiento"
    t.integer  "edad"
    t.string   "direccion"
    t.integer  "telefono"
    t.string   "pais"
    t.boolean  "premium"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "valorations", force: :cascade do |t|
    t.integer  "valor"
    t.integer  "user_id"
    t.integer  "couch_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "reservation_id"
  end

  create_table "valorationusers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "userValora_id"
    t.integer  "valor"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
