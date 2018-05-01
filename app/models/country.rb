class Country < ApplicationRecord

	has_many :states
	has_many :suburbs
	
	default_scope {where(deleted_flag:"N")}
	
	validates :code_name, presence: { message:"error_code_name_empty" },
						  uniqueness: {message:"error_code_name_in_user"}
end
