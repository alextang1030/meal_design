class EventRestaurant < ApplicationRecord

	has_one :restaurant
	
	belongs_to :event, foreign_key: "event_id"
	
	default_scope {where(deleted_flag:"N")}
	
end
