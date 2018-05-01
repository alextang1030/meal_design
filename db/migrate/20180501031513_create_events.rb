class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
	  t.string :user_id, limit: 50
	  t.string :event_name
	  t.date :event_date
	  t.time :event_time
	  t.string :restaurant_id, limit: 50
	  t.string :schedule_flag, limit: 1, default: "N"
	  t.string :mon_flag, limit: 1, default: "N"
	  t.string :tue_flag, limit: 1, default: "N"
	  t.string :wed_flag, limit: 1, default: "N"
	  t.string :thr_flag, limit: 1, default: "N"
	  t.string :fri_flag, limit: 1, default: "N"
	  t.string :sat_flag, limit: 1, default: "N"
	  t.string :sun_flag, limit: 1, default: "N"
	  t.string :deleted_flag, limit: 1, default: "N"
      t.timestamps
    end
  end
end
