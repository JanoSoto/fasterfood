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

ActiveRecord::Schema.define(version: 20140611120712) do

  create_table "alerta_obsolescencia", force: true do |t|
    t.string   "tiempo_emision"
    t.boolean  "visualizada"
    t.boolean  "necesidad_cubierta"
    t.integer  "lote_id"
    t.string   "mensaje"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alerta_stock", force: true do |t|
    t.integer  "ingrediente_id"
    t.integer  "insumo_id"
    t.string   "mensaje"
    t.boolean  "visualizada"
    t.boolean  "necesidad_cubierta"
    t.datetime "tiempo_emision"
  end

  create_table "alerta_temporizador", force: true do |t|
    t.datetime "tiempo_emision"
    t.boolean  "visualizada"
    t.boolean  "necesidad_cubierta"
    t.integer  "venta_id"
    t.string   "mensaje"
  end

  create_table "basicos", force: true do |t|
    t.integer  "precio"
    t.string   "nombre_producto"
    t.boolean  "en_venta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "compuestos", force: true do |t|
    t.integer  "precio"
    t.string   "nombre_producto"
    t.boolean  "en_venta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
