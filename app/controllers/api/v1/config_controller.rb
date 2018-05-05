class Api::V1::ConfigController < Api::ApiController

	def countries
		render json: helpers.response_array(0,"",Country.find_each.map{ |country|
			{
				:country_id => country.id,
				:code_name => country.code_name
			}
		})
	end
	
	def states
		render json: helpers.response_array(0,"",State.find_each.map{ |state|
			{
				:state_id => state.id,
				:code_name => state.code_name
			}
		})
	end
	
	def suburbs
		render json: helpers.response_array(0,"",Suburb.find_each.map{ |suburb|
			{
				:suburb_id => suburb.id,
				:code_name => suburb.code_name
			}
		})
	end
	
end
