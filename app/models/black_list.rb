class BlackList < ApplicationRecord

	has_one :restaurunt
	
	belongs_to :user, foreign_key: "user_id"
	
	default_scope {where(deleted_flag:"N")}
	
end
