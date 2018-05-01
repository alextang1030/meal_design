class Api::V1::GroupController < Api::ApiController
	
	def list
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		
		render json: self.response_array(0,"",UserGroupMember.where({user_id: @user.user_id}).find_each.map{|member|
			{
				:group_id => member.user_group.id,
				:group_name => member.user_group.group_name,
				:members => member.user_group.user_group_members.count
			}
		})
	end
	
	def get
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		
		if !params[:id].present? || !UserGroup.exists?(params[:id]) || !UserGroupMember.exists?({user_id: @user.user_id, group_id: params[:id]})
			render json: self.response_array(1,"error_group_not_found",{})
			return
		end
		
		group = UserGroup.find(params[:id])
		
		render json: self.response_array(0,"",{
			:group_id => group.id,
			:group_name => group.group_name,
			:members => group.user_group_members.find_each.map{ |member|
				{
					:member_id => member.id,
					:user_name => member.user.user_name,
					:profile => self.get_image(member.user.profile)
				}
			}
		})
	end
	
	def edit
	
	end
	
	def add_users
	
	end
	
	def delete
	
	end
end
