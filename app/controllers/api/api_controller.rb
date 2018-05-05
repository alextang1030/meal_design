class Api::ApiController < ActionController::API

	# protect_from_forgery with: :null_session
	
	include Api::ApiHelper
	
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
