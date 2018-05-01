class Api::ApiController < ActionController::API

	protect_from_forgery with: :null_session
	
	def response_array(code,msg,data)
		temp = {
			:response_code => code,
			:response_msg => msg,
			:response_data => data
		}

		temp
	end
	
	def return_user(user)
		result = {
			:user_id => user.user_id
			:user_name => user.user_name,
			:profile => self.get_image(user.profile)
		}
		
		result
	end
	
	
	def return_restaurant(restaurant)
		result = {
			:restaurant_id => restaurant.restaurant_id,
			:name => restaurant.name,
			:address => restaurant.address,
			:total_stars => restaurant.reviews.average(:stars)
			:suburb => restaurant.suburb.code_name,
			:state => restaurant.suburb.state.code_name,
			:country => restaurant.suburb.state.country.code_name,
			:image => self.get_image(restaurant.image)
		}
	end
	
	def get_image(obj)
		result = {
			:original => !obj.nil? "#{request.protocol}#{request.domain}"+obj.url(:original) : "",
			:thumb => !obj.nil? "#{request.protocol}#{request.domain}"+obj.url(:thumb) : "",
		}
		
		result
	end
	
	def user_auth()
		msg = ""

		@user = nil
		if !request.headers["HTTP_USER_TOKEN"].present?
			msg = "error_user_token_empty"
			return msg
		end
		if UserLoginToken.exists?(request.headers["HTTP_USER_TOKEN"])
			@user = UserLoginToken.find(request.headers["HTTP_USER_TOKEN"]).user
		else
			msg = "error_user_token_expired"
			return msg
		end

		msg
	end
end
