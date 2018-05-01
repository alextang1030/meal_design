class State < ApplicationRecord
	
	has_many :suburbs
	belongs_to :country, foreign_key: "country_id"
	
	default_scope {where(deleted_flag:"N")}
	
	validates :code_name, presence: { message:"error_code_name_empty" }
	
end
