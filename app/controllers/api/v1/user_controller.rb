class Api::V1::UserController < ApplicationController

	def create_token(user)
		token = user.user_login_tokens.create([
			user_ip: request.remote_ip,
			user_agent: request.user_agent
		])
		result = self.return_user(user)
		result[:token_id] = token.token_id
		
		result
	end

	def get
	
	end
	
	def registration
	
	end
	
	def login
	
	end
	
	def edit
	
	end
	
end
