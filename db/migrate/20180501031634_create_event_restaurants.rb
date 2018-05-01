class CreateEventRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :event_restaurants do |t|
	  t.integer :event_id, limit: 8
	  t.string :user_id, limit: 50
	  t.string :restaurant_id, limit: 50
	  t.string :deleted_flag, limit: 1, default: "N"
      t.timestamps
    end
  end
end
