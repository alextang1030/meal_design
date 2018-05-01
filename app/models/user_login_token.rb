class UserLoginToken < ApplicationRecord
	
	require 'securerandom'
	
	belongs_to :user, foreign_key: "user_id"
	
	default_scope {where("expried_date > ?","#{DateTime.current.to_formatted_s(:db)}")}
	
	before_create do
		self.token_id = SecureRandom.hex(17)
		self.expried_date = DateTime.current.next_day(30).to_formatted_s(:db)
	end
end
