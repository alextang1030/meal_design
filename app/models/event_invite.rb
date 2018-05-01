class EventInvite < ApplicationRecord

	belongs_to :user, foreign_key: "user_id"
	belongs_to :event, foreign_key: "event_id"
	
	default_scope {where(deleted_flag:"N")}
	
	CURRENT_STATUS = %w(attend invited cancelled)
	
	validates :status, inclusion: { message: "error_status_not_support", :in => CURRENT_STATUS }
	
end
