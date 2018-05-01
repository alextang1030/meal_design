class UserGroup < ApplicationRecord

	has_many :user_group_members, foreign_key: "group_id"
	
	belongs_to :user, foreign_key: "user_id"
	
	default_scope {where(deleted_flag:"N")}
	
	validates :group_name, presence: { message:"error_group_name_empty" }
	
end
