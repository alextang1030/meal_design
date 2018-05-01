class Api::V1::EventController < Api::ApiController

	def return_event(event)
		result = {
			:event_id => event.id,
			:event_name => event.event_name,
			:event_date => event.event_date,
			:event_time => event.event_time,
			:schedule_flag => event.schedule_flag,
			:mon_flag => event.mon_flag,
			:tue_flag => event.tue_flag,
			:wed_flag => event.wed_flag,
			:thr_flag => event.thr_flag,
			:fri_flag => event.fri_flag,
			:sat_flag => event.sat_flag,
			:sun_flag => event.sun_flag,
			:restaurant => event.restaurant_id.present? ? self.return_restaurant(Restaurant.find(event.restaurant_id)) : nil,
			:invited => event.event_invites.where.not({status: "cancelled"}).count,
			:attend => event.event_invites.where({status: "attend"}).count,
			:members => event.event_invites.map{|member|
				temp = self.return_user(member.user)
				temp[:status] = member.status
				temp
			},
			:restaurants => event.event_restaurants.map{|res|
				self.return_restaurant(res.restaurant)
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
		
		render json: self.response_array(0,"",@user.event_invites.where.not({status: "cancelled"}).map{|invite|
			event = invite.event
			{
				:event_id => event.id,
				:event_name => event.event_name,
				:event_date => event.event_date,
				:event_time => event.event_time,
				:restaurant => event.restaurant_id.present? ? self.return_restaurant(Restaurant.find(event.restaurant_id)) : nil,
				:invited => event.event_invites.where.not({status: "cancelled"}).count,
				:attend => event.event_invites.where({status: "attend"}).count,
				:restaurants => event.event_restaurants.count
			}
		})
	end
	
	def get
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		
		if !params[:id].present? || !@user.event_invites.exists?({event_id: params[:id]})
			render json: self.response_array(1,"error_event_not_found",{})
			return
		end
		
		event = @user.event_invites.find_by({event_id: params[:id]}).event
		
		render json: self.response_array(0,"",self.return_event(event))
	end
	
	def edit
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		
		if !params[:id].present? || !@user.events.exists?(params[:id])
			event = @user.events.new
		else
			event = @user.events.find(params[:id])
		end
		
		event.attributes.keys.each do |k|
			if !["id","deleted_flag"].include?(k) && params[k].present?
				event[k] = params[k]
			end
		end
		
		if event.valid?
			event.save
		else
			render json: self.response_array(1,event.errors.full_messages[0],{})
			return
		end
		
		if !params[:id].present? || !@user.events.exists?(params[:id])
			event.event_invites.create({
				user_id: @user.user_id
			});
		end
		
		render json: self.response_array(0,"",self.return_event(event))
		
	end
	
	def add_users
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		
		if !params[:id].present? || !@user.events.exists?(params[:id])
			render json: self.response_array(1,"error_event_not_found",{})
			return
		else
			event = @user.events.find(params[:id])
		end
		
		if params[:members].present?
			params[:members].each do |member|
				if User.exists?(member) && !event.event_invites.exists?({user_id: member})
					event.event_invites.create({
						user_id: member
					})
				end
			end
		end
		
		render json: self.response_array(0,"",self.return_event(event))
	end
	
	def remove_users
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		
		if !params[:id].present? || !@user.events.exists?(params[:id])
			render json: self.response_array(1,"error_event_not_found",{})
			return
		else
			event = @user.events.find(params[:id])
		end
		
		if params[:members].present?
			params[:members].each do |member|
				if event.event_invites.exists?({user_id: member})
					temp = event.event_invites.find_by({user_id: member})
					temp.deleted_flag = "Y"
					temp.save
				end
			end
		end
		
		render json: self.response_array(0,"",self.return_event(event))
	end
	
	def status
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		
		if !params[:id].present? || !@user.events.exists?(params[:id])
			render json: self.response_array(1,"error_event_not_found",{})
			return
		else
			event = @user.events.find(params[:id])
		end
		
		invited = event.event_invites.find_by({user_id: @user})
		
		invited.status = params[:status].present? ? params[:status] : ""
		
		if invited.valid?
			invited.save
		else
			render json: self.response_array(1,invited.errors.full_messages[0],{})
			return
		end
		
		render json: self.response_array(0,"",self.return_event(event))
	end
	
	def leave
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		
		if !params[:id].present? || !@user.event_invites.exists?({event_id: params[:id]})
			render json: self.response_array(1,"error_event_not_found",{})
			return
		else
			invited = @user.event_invites.find_by({event_id: params[:id]})
		end
		
		invited.deleted_flag = "Y"
		
		if invited.valid?
			invited.save
		else
			render json: self.response_array(1,invited.errors.full_messages[0],{})
			return
		end
		
		render json: self.response_array(0,"",{})
	end
	
	def add_restaurants
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		
		if !params[:id].present? || !@user.events.exists?(params[:id])
			render json: self.response_array(1,"error_event_not_found",{})
			return
		else
			event = @user.events.find(params[:id])
		end
		
		if params[:restaurants].present?
			params[:restaurants].each do |restaurant|
				if Restaurant.exists?(restaurant) && !event.event_restaurants.exists?({restaurant_id: restaurant})
					event.event_restaurants.create({
						restaurant_id: restaurant
					})
				end
			end
		end
		
		render json: self.response_array(0,"",self.return_event(event))
	end
	
	def remove_restaurants
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		
		if !params[:id].present? || !@user.events.exists?(params[:id])
			render json: self.response_array(1,"error_event_not_found",{})
			return
		else
			event = @user.events.find(params[:id])
		end
		
		if params[:restaurants].present?
			params[:restaurants].each do |restaurant|
				if event.event_restaurants.exists?({restaurant_id: restaurant})
					temp = event.event_restaurants.find_by({restaurant_id: restaurant})
					temp.deleted_flag = "Y"
					temp.save
				end
			end
		end
		
		render json: self.response_array(0,"",self.return_event(event))
	end
	
	def delete
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		
		if !params[:id].present? || !@user.events.exists?(params[:id])
			render json: self.response_array(1,"error_event_not_found",{})
			return
		else
			event = @user.events.find(params[:id])
		end
		
		event.event_invites.update_all(deleted_flag: "Y")
		event.event_restaurants.update_all(deleted_flag: "Y")
		event.deleted_flag = "Y"
		event.save
		
		render json: self.response_array(0,"",{})
	end
end
