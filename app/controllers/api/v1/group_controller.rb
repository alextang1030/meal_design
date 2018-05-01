class Api::V1::GroupController < Api::ApiController
	
	def return_group(group)
		result = {
			:group_id => group.id,
			:group_name => group.group_name,
			:members => group.user_group_members.find_each.map{ |member|
				{
					:member_id => member.id,
					:user_name => member.user.user_name,
					:profile => self.get_image(member.user.profile)
				}
			}
		}
		
		result
	end
	
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
		
		render json: self.response_array(0,"",self.return_group(group))
	end
	
	def edit
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		
		
		if !params[:id].present?
			group = @user.user_groups.new
		else 
			if !@user.user_groups.exists?(params[:id])
				render json: self.response_array(1,"error_group_not_found",{})
				return
			else
				group = @user.user_groups.find(params[:id])
			end
		end
		
		if params[:group_name].present?
			group.group_name = params[:group_name]
		end
		
		if group.valid?
			group.save
		else
			render json: self.response_array(1,group.errors.full_messages[0],{})
			return
		end
		
		if !params[:id].present?
			group.user_group_members.create({
				user_id: @user.user_id,
				user_role: "admin"
			})
		end
		render json: self.response_array(0,"",self.return_group(group))
		
	end
	
	def add_users
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
		
		if params[:members].present? && params[:members].kind_of?(Array)
			params[:members].each do |member|
				if User.exists?(member) && !group.user_group_members.exists?({user_id: member})
					group.user_group_members.create({
						user_id: User.find(member).user_id
					})
				end
			end
		end
		
		render json: self.response_array(0,"",self.return_group(group))
	end
	
	def remove_users
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
		
		if params[:members].present? && params[:members].kind_of?(Array)
			params[:members].each do |member|
				if User.exists?(member) && group.user_group_members.exists?({user_id: member})
					m = group.user_group_members.find_by({user_id: member})
					if m.user_role == "member"
						m.deleted_flag = "Y"
						m.save
					end
				end
			end
		end
		
		render json: self.response_array(0,"",self.return_group(group))
	end
	
	def delete
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
		
		group.user_group_members.update_all(deleted_flag: "Y")
		group.deleted_flag = "Y"
		group.save
		
		render json: self.response_array(0,"",{})
	end
end
