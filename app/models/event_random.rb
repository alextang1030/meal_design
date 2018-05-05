class EventRandom < ApplicationRecord
	belongs_to :event, foreign_key: "event_id"
	has_one :restaurant, foreign_key: "restaurant_id"
end
