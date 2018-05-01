class CreateUserHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :user_histories do |t|
	  t.integer :event_id, limit: 5
	  t.string :user_id, limit: 50
	  t.string :restaurant_id, limit: 50
      t.timestamps
    end
  end
end
