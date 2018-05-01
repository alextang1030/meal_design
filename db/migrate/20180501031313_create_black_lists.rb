class CreateBlackLists < ActiveRecord::Migration[5.2]
  def change
    create_table :black_lists do |t|
	  t.string :user_id, limit: 50
	  t.string :restaurant_id, limit: 50
	  t.string :deleted_flag, limit: 1, default: "N"
      t.timestamps
    end
  end
end
