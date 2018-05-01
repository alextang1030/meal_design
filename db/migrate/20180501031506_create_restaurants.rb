class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants, id: false do |t|
	  t.string :restaurant_id, limit: 50, primary: true
	  t.string :name
	  t.string :address
	  t.integer :suburb_id, limit: 8
	  t.string :breakfast_flag, limit: 1, default: "N"
	  t.string :lunch_flag, limit: 1, default: "N"
	  t.string :dinner_flag, limit: 1, default: "N"
	  t.string :deleted_flag, limit: 1, default: "N"
      t.timestamps
    end
  end
end
