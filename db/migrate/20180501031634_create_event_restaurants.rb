class CreateEventRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :event_restaurants do |t|

      t.timestamps
    end
  end
end
