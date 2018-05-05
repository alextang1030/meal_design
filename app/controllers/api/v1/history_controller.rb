class Api::V1::HistoryController < Api::ApiController

	def list
		msg = self.user_auth()
		
		if msg.present?
			render json: helpers.response_array(1,msg,{})
			return
		end
		
		render json: helpers.response_array(0,"",@user.user_histories.map{|history|
			{
				:event_id => history.event.id,
				:event_name => history.event.event_name,
				:restaurant_id => history.restaurant.restaurant_id,
				:restaurant_name => history.restaurant.name
			}
		})
	end
	
	def add
		
	end
	
end
