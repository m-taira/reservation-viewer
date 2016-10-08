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

ActiveRecord::Schema.define(version: 20161008012057) do

  create_table "executions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "execute_datetime"
    t.string   "kind"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "reservations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "shop_id"
    t.integer  "execution_id"
    t.integer  "amount"
    t.datetime "scheduled_datetime"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["execution_id"], name: "index_reservations_on_execution_id", using: :btree
    t.index ["shop_id"], name: "index_reservations_on_shop_id", using: :btree
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "cd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reservations", "executions"
  add_foreign_key "reservations", "shops"
end
