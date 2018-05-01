class Review < ApplicationRecord
	
	has_one :user
	
	belongs_to :restaurunt, foreign_key: "restaurunt_id"
	
	default_scope {where(deleted_flag:"N")}
	
	validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
	
end
