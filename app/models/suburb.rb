class Suburb < ApplicationRecord

	has_many :restaurants
	belongs_to :state, foreign_key: "state_id"
	belongs_to :country, foreign_key: "country_id"
	
	default_scope {where(deleted_flag:"N")}
	
	validates :code_name, presence: { message:"error_code_name_empty" }
end
