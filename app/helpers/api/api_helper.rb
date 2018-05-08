module Api::ApiHelper
	
	def response_array(code,msg,data)
		temp = {
			:response_code => code,
			:response_msg => msg,
			:response_data => data
		}

		temp
	end
	
	def get_image(obj)
		result = {
			:original => !obj.nil? ? "#{request.protocol}#{request.host_with_port}/"+obj.url(:original) : "",
			:thumb => !obj.nil? ? "#{request.protocol}#{request.host_with_port}/"+obj.url(:thumb) : "",
		}
		
		result
	end
	
	
	def return_user(user)
		result = {
			:user_id => user.user_id,
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
			:total_stars => restaurant.reviews.average(:stars),
			:suburb => restaurant.suburb.code_name,
			:state => restaurant.suburb.state.code_name,
			:country => restaurant.suburb.state.country.code_name,
			:image => self.get_image(restaurant.image)
		}
	end
	
	def gen_event_result(event)
		
		if event.event_randoms.count == 0
			if event.event_restaurants.count == 0
				self.response_array(1,"error_no_restaurants_in_event",{})
				return
			end
			
			outlist = []
			event.event_invites.where({status: "attend"}).each do |row|
				user = row.user
				user.black_lists.find_each do |tmp|
					if !outlist.include?(tmp.restaurant_id)
						outlist.push(tmp.restaurant_id)
					end
				end
			end
			tmp = UserHistory.where({event_id: event.id}).order(created_at: :desc).first
			outlist_with_history = outlist;
			if !tmp.nil?
				outlist_with_history.push(tmp.restaurant_id)
			end
			restaurants = event.event_restaurants.where.not(restaurant_id: outlist_with_history)
			if restaurants.count == 0
				restaurants = event.event_restaurants.where.not(restaurant_id: outlist)
			end
			
			if restaurants.count == 0
				temp = {
					:response_code => 1,
					:response_msg => "error_all_restaurant_in_blacklist",
					:response_data => {}
				}
				temp
				return
			end
			
			event.event_randoms.create(restaurants.find_each.map{|restaurant|
				{
					restaurant_id: restaurant.restaurant_id
				}
			})
		end
		
		random = event.event_randoms.order("RAND()").first
		result = Restaurant.find(random.restaurant_id)
		temp = self.response_array(0,"",self.return_restaurant(result))
		event.restaurant_id = random.restaurant_id
		event.save
		event.event_randoms.destroy(random.id)
		
		temp
	end
end
