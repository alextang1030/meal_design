class Api::V1::FavouriteController < Api::ApiController

	def list
		msg = self.user_auth()
		
		if msg.present?
			render json: helpers.response_array(1,msg,{})
			return
		end
		
		render json: helpers.response_array(0,"",@user.fav_lists.map{ |fav|
			helpers.return_restaurant(fav.restaurant)
		})
	end
	
	def add
		msg = self.user_auth()
		
		if msg.present?
			render json: helpers.response_array(1,msg,{})
			return
		end
		if !params[:id].present? || !Restaurant.exists?(params[:id])
			render json: helpers.response_array(1,"error_restaurant_not_found",{})
			return
		end
		if @user.fav_lists.exists?({restaurant_id:params[:id]})
			render json: helpers.response_array(1,"error_item_exists",{})
			return
		end
		fav = FavList.new
		
		fav.user_id = @user.user_id
		fav.restaurant_id = params[:id]
		if fav.valid?
			fav.save
		else
			render json: helpers.response_array(1,fav.errors.full_messages[0],{})
			return
		end
		
		render json: helpers.response_array(0,"",helpers.return_restaurant(fav.restaurant))
		
	end
	
	def delete
		msg = self.user_auth()
		
		if msg.present?
			render json: helpers.response_array(1,msg,{})
			return
		end
		if !params[:id].present? || !Restaurant.exists?(params[:id])
			render json: helpers.response_array(1,"error_restaurant_not_found",{})
			return
		end
		if !@user.fav_lists.exists?({restaurant_id:params[:id]})
			render json: helpers.response_array(1,"error_item_not_exists",{})
			return
		end
		fav = @user.fav_lists.find_by(restaurant_id:params[:id])
		
		fav.deleted_flag = "Y"
		
		fav.save
		
		render json: helpers.response_array(0,"",{})
	end
	
end
