class Api::V1::BlacklistController < Api::ApiController
	def list
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		
		render json: self.response_array(0,"",@user.black_lists.map{ |black|
			self.return_restaurant(black.restaurant)
		})
	end
	
	def add
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		if !params[:id].present? || !Restaurant.exists?(params[:id])
			render json: self.response_array(1,"error_restaurant_not_found",{})
			return
		end
		if @user.black_lists.exists?({restaurant_id:params[:id]})
			render json: self.response_array(1,"error_item_exists",{})
			return
		end
		black = BlackList.new
		
		black.user_id = @user.user_id
		black.restaurant_id = params[:id]
		if black.valid?
			black.save
		else
			render json: self.response_array(1,black.errors.full_messages[0],{})
			return
		end
		
		render json: self.response_array(0,"",self.return_restaurant(black.restaurant))
		
	end
	
	def delete
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		if !params[:id].present? || !Restaurant.exists?(params[:id])
			render json: self.response_array(1,"error_restaurant_not_found",{})
			return
		end
		if !@user.black_lists.exists?({restaurant_id:params[:id]})
			render json: self.response_array(1,"error_item_not_exists",{})
			return
		end
		black = @user.black_lists.find_by(restaurant_id:params[:id])
		
		black.deleted_flag = "Y"
		
		black.save
		
		render json: self.response_array(0,"",{})
	end
	
end
