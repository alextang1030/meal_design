class FavList < ApplicationRecord
	
	belongs_to :restaurant, foreign_key: "restaurant_id"
	belongs_to :user, foreign_key: "user_id"
	
	default_scope {where(deleted_flag:"N")}
	
end
