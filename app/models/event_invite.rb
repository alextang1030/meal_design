class EventInvite < ApplicationRecord

	has_one :user
	
	belongs_to :event, foreign_key: "event_id"
	
	CURRENT_STATUS = %w(attend invited cancel)
	
	validates :status, inclusion: { message: "error_status_not_support", :in => CURRENT_STATUS }
	
end
