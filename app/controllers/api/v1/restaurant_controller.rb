class Api::V1::RestaurantController < Api::ApiController
	
	def list
		msg = self.user_auth()
		
		restaurants = Restaurant.order(:created_at)
		
		if params[:search].present?
			restaurants = restaurants.where("lower(name) LIKE :search OR lower(address) LIKE :search",{:search => "%#{params[:search].downcase}%"})
		end
		
		if params[:suburb].present?
			restaurants = restaurants.where({suburb_id: params[:suburb]}) 
		end
		
		render json: helpers.response_array(0,"",restaurants.map{|restaurant|
			temp = helpers.return_restaurant(restaurant)
			if !@user.nil?
				temp[:is_fav] = (FavList.exists?({user_id: @user.user_id, restaurant_id: restaurant.restaurant_id})) ? true : false
				temp[:is_black] = (BlackList.exists?({user_id: @user.user_id, restaurant_id: restaurant.restaurant_id})) ? true : false
			end
			temp
		})
	end
	
	def get
		
		msg = self.user_auth()
		
		if !params[:id].present? || !Restaurant.exists?(params[:id])
			render json: helpers.response_array(1,"error_restaurant_not_found",{})
			return
		end
		
		restaurant = Restaurant.find(params[:id])
		
		result = {
			:restaurant_id => restaurant.restaurant_id,
			:name => restaurant.name,
			:address => restaurant.address,
			:total_stars => restaurant.reviews.average(:stars),
			:suburb => restaurant.suburb.code_name,
			:state => restaurant.suburb.state.code_name,
			:country => restaurant.suburb.state.country.code_name,
			:image => helpers.get_image(restaurant.image),
			:reviews => restaurant.reviews.map{ |review|
				{
					:user => helpers.return_user(review.user),
					:stars => review.stars,
					:created_at => review.created_at
				}
			}
		}
		if !@user.nil?
			result[:is_fav] = (FavList.exists?({user_id: @user.user_id, restaurant_id: restaurant.restaurant_id})) ? true : false
			result[:is_black] = (BlackList.exists?({user_id: @user.user_id, restaurant_id: restaurant.restaurant_id})) ? true : false
		end
		
		render json: helpers.response_array(0,"",result)
	end
end
