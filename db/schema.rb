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

ActiveRecord::Schema.define(version: 20140630020308) do

  create_table "alerta_obsolescencia", force: true do |t|
    t.string  "tiempo_emision"
    t.boolean "visualizada"
    t.boolean "necesidad_cubierta"
    t.integer "lote_id"
    t.string  "mensaje"
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
    t.integer "precio"
    t.string  "nombre_producto"
    t.boolean "en_venta"
  end

  create_table "composicions", force: true do |t|
    t.integer "basico_id"
    t.integer "compuesto_id"
    t.integer "cantidad"
  end

  create_table "compuestos", force: true do |t|
    t.integer  "precio"
    t.string   "nombre_producto"
    t.boolean  "en_venta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "detalles", force: true do |t|
    t.integer  "compuesto_id"
    t.integer  "basico_id"
    t.string   "estado",                      limit: 20
    t.datetime "tiempo_entrega"
    t.datetime "tiempo_en_espera"
    t.datetime "tiempo_preparando"
    t.datetime "tiempo_terminado"
    t.datetime "tiempo_entregado_deseachado"
    t.integer  "intento_entrega"
    t.integer  "precio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venta_id"
    t.integer  "cantidad"
    t.string   "comentario",                  limit: 20
  end

  create_table "detalles_basicos", force: true do |t|
    t.integer  "basico_id"
    t.integer  "ingrediente_id"
    t.integer  "cantidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entregas", force: true do |t|
    t.datetime "fecha_hora_entrega"
    t.integer  "proveedor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entregas", ["proveedor_id"], name: "index_entregas_on_proveedor_id", using: :btree

  create_table "ingredientes", force: true do |t|
    t.boolean  "refrigerado"
    t.string   "nombre",        limit: 50
    t.string   "categoria",     limit: 20
    t.integer  "stock_actual"
    t.integer  "stock_critico"
    t.integer  "stock_ideal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insumos", force: true do |t|
    t.string   "tipo_insumo"
    t.string   "nombre_insumo"
    t.string   "categoria_insumo"
    t.integer  "stock_actual"
    t.integer  "stock_critico"
    t.integer  "stock_ideal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lotes", force: true do |t|
    t.datetime "fecha_hora_llegada"
    t.date     "fecha_vencimiento"
    t.integer  "ingrediente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "numero_lote"
  end

  add_index "lotes", ["ingrediente_id"], name: "index_lotes_on_ingrediente_id", using: :btree

  create_table "merma_ingredientes", force: true do |t|
    t.integer  "cantidad"
    t.date     "fecha_merma"
    t.string   "comentario_merma"
    t.integer  "ingrediente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "merma_ingredientes", ["ingrediente_id"], name: "index_merma_ingredientes_on_ingrediente_id", using: :btree

  create_table "merma_insumos", force: true do |t|
    t.integer  "cantidad_merma"
    t.date     "fecha_merma"
    t.string   "comentario_merma"
    t.integer  "insumo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "merma_insumos", ["insumo_id"], name: "index_merma_insumos_on_insumo_id", using: :btree

  create_table "merma_materials", force: true do |t|
    t.integer  "cantidad_merma"
    t.datetime "fecha_merma"
    t.string   "comentario_merma"
    t.integer  "ingredientes_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "merma_materials", ["ingredientes_id"], name: "index_merma_materials_on_ingredientes_id", using: :btree

  create_table "mermas", force: true do |t|
    t.integer  "cantidad_merma"
    t.datetime "fecha_merma"
    t.string   "comentario_merma"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proveedors", force: true do |t|
    t.string   "rut_proveedor"
    t.string   "nombre_proveedor"
    t.integer  "telefono_proveedor"
    t.string   "email_proveedor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rut"
    t.string   "nombre",                 limit: 20
    t.string   "apellido_paterno",       limit: 20
    t.string   "apellido_materno",       limit: 20
    t.integer  "telefono",               limit: 8
    t.integer  "user_id"
    t.integer  "rol"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vendedors", force: true do |t|
    t.integer  "rut"
    t.string   "nombre",           limit: 20
    t.string   "apellido_paterno", limit: 20
    t.string   "apellido_materno", limit: 20
    t.integer  "telefono",         limit: 8
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venta", force: true do |t|
    t.integer  "vendedor_id",                        null: false
    t.datetime "fecha_hora",                         null: false
    t.string   "nombre_cliente",         limit: 20,  null: false
    t.integer  "precio_total",                       null: false
    t.string   "comentario_perdida",     limit: 200, null: false
    t.integer  "numero_de_caja"
    t.string   "estado_venta",           limit: 20
    t.datetime "tiempo_terminado_venta"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cantidad"
  end

end
