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

ActiveRecord::Schema.define(version: 2021_05_21_100044) do

  create_table "administradors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "num_tlf"
    t.string "email"
    t.string "pass"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_administradors_on_email", unique: true
  end

  create_table "alumnos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "num_tlf"
    t.string "email"
    t.string "pass"
    t.string "domicilio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_alumnos_on_email", unique: true
  end

  create_table "asignaturas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.bigint "profesores_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nombre"], name: "index_asignaturas_on_nombre", unique: true
    t.index ["profesores_id"], name: "index_asignaturas_on_profesores_id"
  end

  create_table "examenes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.date "fecha"
    t.bigint "asignaturas_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asignaturas_id"], name: "index_examenes_on_asignaturas_id"
  end

  create_table "matriculas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "asignaturas_id", null: false
    t.bigint "alumnos_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alumnos_id"], name: "index_matriculas_on_alumnos_id"
    t.index ["asignaturas_id"], name: "index_matriculas_on_asignaturas_id"
  end

  create_table "nota", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "alumnos_id", null: false
    t.bigint "examenes_id", null: false
    t.integer "nota"
    t.string "foto"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alumnos_id"], name: "index_nota_on_alumnos_id"
    t.index ["examenes_id"], name: "index_nota_on_examenes_id"
  end

  create_table "profesores", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "num_tlf"
    t.string "email"
    t.string "pass"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_profesores_on_email", unique: true
  end

  add_foreign_key "asignaturas", "profesores", column: "profesores_id"
  add_foreign_key "examenes", "asignaturas", column: "asignaturas_id"
  add_foreign_key "matriculas", "alumnos", column: "alumnos_id"
  add_foreign_key "matriculas", "asignaturas", column: "asignaturas_id"
  add_foreign_key "nota", "alumnos", column: "alumnos_id"
  add_foreign_key "nota", "examenes", column: "examenes_id"
end
