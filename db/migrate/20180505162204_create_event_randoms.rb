class CreateEventRandoms < ActiveRecord::Migration[5.2]
  def change
    create_table :event_randoms do |t|
	  t.integer :event_id, limit: 8
	  t.string :restaurant_id, limit: 50
      t.timestamps
    end
  end
end
