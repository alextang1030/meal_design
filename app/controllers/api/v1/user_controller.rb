class Api::V1::UserController < Api::ApiController

	require 'digest/md5'
	
	def create_token(user)
		token = user.user_login_tokens.create({
			user_ip: request.remote_ip,
			user_agent: request.user_agent
		})
		result = self.return_user(user)
		result["token_id"] = token.token_id
		
		result
	end

	def get
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		result = self.return_user(@user)
		
		render json: self.response_array(0,"",result)
	end
	
	def registration
		
		if params[:provider].present?
		
		end
		
		user = User.new
		
		user.attributes.keys.each do |k|
			if !["user_id","deleted_flag"].include?(k) && params[k].present?
				user[k] = params[k]
			end
		end
		if !params[:password_confirmation].present?
			user.password_confirmation = ""
		end
		
		if user.valid?
			user.save
		else
			render json: self.response_array(1,user.errors.full_messages[0],{})
			return
		end
		
		token = self.create_token(user)
		
		render json: self.response_array(0,"",token)
	end
	
	def login
		
		if !params[:email].present? || !params[:password].present?
			render json: self.response_array(1,"error_email_or_password_missing",{})
			return
		end
		
		if User.exists?({email: params[:email], password: Digest::MD5.hexdigest(params[:password])})
			user = User.find_by({email: params[:email], password: Digest::MD5.hexdigest(params[:password])})
		else
			render json: self.response_array(1,"error_user_not_found",{})
			return
		end
		
		token = self.create_token(user)
		
		render json: self.response_array(0,"",token)
		
	end
	
	def edit
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		
		@user.attributes.keys.each do |k|
			if ["user_name","password","password_confirmation"].include?(k) && params[k].present?
				@user[k] = params[k]
			end
		end
		
		if params[:password].present? && !params[:password_confirmation].present?
			@user.password_confirmation = ""
		end
		
		if params[:profile].present?
			img = params[:profile]
			ext = File.extname img.tempfile
			uploaded_file = ActionDispatch::Http::UploadedFile.new(
					tempfile: img.tempfile,
					filename: SecureRandom.hex(17)+ext
				)
			@user.profile = uploaded_file
		end
		
		if @user.valid?
			@user.save
		else
			render json: self.response_array(1,@user.errors.full_messages[0],{})
			return
		end
		
		result = self.return_user(@user)
		render json: self.response_array(0,"",result)
	end
	
	
	def search
		msg = self.user_auth()
		
		if msg.present?
			render json: self.response_array(1,msg,{})
			return
		end
		
		result = {}
		if params[:search].present?
			users = User.where("lower(user_name) LIKE :search or email = :email",{ 
				:search => "%#{params[:search].downcase}%",
				:email => params[:search]
			})
			
			result = users.find_each.map{ |user|
				self.return_user(user)
			}
		end
		
		render json: self.response_array(0,"",result)
	end
end
