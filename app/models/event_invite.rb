class EventInvite < ApplicationRecord

	belongs_to :user, foreign_key: "user_id"
	belongs_to :event, foreign_key: "event_id"
	
	CURRENT_STATUS = %w(attend invited cancel)
	
	validates :status, inclusion: { message: "error_status_not_support", :in => CURRENT_STATUS }
	
end
