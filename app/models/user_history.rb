class UserHistory < ApplicationRecord

	belongs_to :user, foreign_key: "user_id"
	belongs_to :event, foreign_key: "event_id"
	belongs_to :restaurant, foreign_key: "restaurant_id"
	
end
