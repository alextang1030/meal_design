class UserGroupMember < ApplicationRecord
	
	belongs_to :user, foreign_key: "user_id"
	belongs_to :user_group, foreign_key: "group_id"
	
	default_scope {where(deleted_flag:"N")}
	
	CURRENT_STATUS = %w(admin member)
	
	validates :user_role, inclusion: { message: "error_user_role_not_support", :in => CURRENT_STATUS }
	
end
