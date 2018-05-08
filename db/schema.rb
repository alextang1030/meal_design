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

ActiveRecord::Schema.define(version: 2018_05_05_162204) do

  create_table "black_lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", limit: 50
    t.string "restaurant_id", limit: 50
    t.string "deleted_flag", limit: 1, default: "N"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code_name"
    t.string "deleted_flag", limit: 1, default: "N"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_invites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "event_id"
    t.string "user_id", limit: 50
    t.string "status", default: "invited"
    t.string "deleted_flag", limit: 1, default: "N"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_randoms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "event_id"
    t.string "restaurant_id", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_restaurants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "event_id"
    t.string "user_id", limit: 50
    t.string "restaurant_id", limit: 50
    t.string "deleted_flag", limit: 1, default: "N"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", limit: 50
    t.string "event_name"
    t.date "event_date"
    t.time "event_time"
    t.string "restaurant_id", limit: 50
    t.string "schedule_flag", limit: 1, default: "N"
    t.string "mon_flag", limit: 1, default: "N"
    t.string "tue_flag", limit: 1, default: "N"
    t.string "wed_flag", limit: 1, default: "N"
    t.string "thr_flag", limit: 1, default: "N"
    t.string "fri_flag", limit: 1, default: "N"
    t.string "sat_flag", limit: 1, default: "N"
    t.string "sun_flag", limit: 1, default: "N"
    t.string "finish_flag", limit: 1, default: "N"
    t.string "deleted_flag", limit: 1, default: "N"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fav_lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", limit: 50
    t.string "restaurant_id", limit: 50
    t.string "deleted_flag", limit: 1, default: "N"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "restaurant_id", limit: 50
    t.string "name"
    t.string "address"
    t.string "type"
    t.bigint "suburb_id"
    t.string "avg_price"
    t.string "breakfast_flag", limit: 1, default: "N"
    t.string "lunch_flag", limit: 1, default: "N"
    t.string "dinner_flag", limit: 1, default: "N"
    t.string "desserts_flag", limit: 1, default: "N"
    t.string "deleted_flag", limit: 1, default: "N"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", limit: 50
    t.string "restaurant_id", limit: 50
    t.integer "stars", limit: 1
    t.string "deleted_flag", limit: 1, default: "N"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "country_id"
    t.string "code_name"
    t.string "deleted_flag", limit: 1, default: "N"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suburbs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "country_id"
    t.bigint "state_id"
    t.string "code_name"
    t.string "deleted_flag", limit: 1, default: "N"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_group_members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "group_id"
    t.string "user_id", limit: 50
    t.string "user_role", default: "member"
    t.string "deleted_flag", limit: 1, default: "N"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", limit: 50
    t.string "group_name"
    t.string "deleted_flag", limit: 1, default: "N"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "event_id"
    t.string "user_id", limit: 50
    t.string "restaurant_id", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_login_tokens", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "token_id", limit: 50
    t.string "user_id", limit: 50
    t.string "user_ip"
    t.string "user_agent"
    t.string "device_id"
    t.datetime "expried_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", limit: 50
    t.string "user_name", limit: 100, null: false
    t.string "email"
    t.string "password"
    t.string "provider"
    t.string "provider_id"
    t.string "deleted_flag", limit: 1, default: "N"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_file_name"
    t.string "profile_content_type"
    t.integer "profile_file_size"
    t.datetime "profile_updated_at"
  end

end
