class Event < ApplicationRecord
	
	has_many :event_invites
	has_many :event_restaurants
	
	belongs_to :user, foreign_key: "user_id"
	
	default_scope {where(deleted_flag:"N")}
	
	validates :event_name, presence: { message:"error_event_name_empty" }
	
end
