class UserHistory < ApplicationRecord

	has_one :restaurunt
	has_one :event, foreign_key: "event_id"
	
	belongs_to :user, foreign_key: "user_id"
	
end
