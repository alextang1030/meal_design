class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
	  t.string :user_id, limit: 50
	  t.string :restaurant_id, limit: 50
	  t.integer :stars, limit: 1
	  t.string :deleted_flag, limit: 1, default: "N"
      t.timestamps
    end
  end
end
