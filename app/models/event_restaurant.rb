class EventRestaurant < ApplicationRecord

	belongs_to :event, foreign_key: "event_id"
	belongs_to :restaurant, foreign_key: "restaurant_id"
	
	default_scope {where(deleted_flag:"N")}
	
end
