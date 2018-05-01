class User < ApplicationRecord
	
	require 'securerandom'
	require 'digest/md5'
	
	self.primary_key = "user_id"
	
	has_many :user_groups
	has_many :user_group_members
	has_many :user_login_tokens
	has_many :events
	has_many :event_invites
	has_many :fav_lists
	has_many :black_lists
	has_many :user_histories
	
	default_scope {where(deleted_flag:"N")}
	
	has_attached_file :profile, styles: { thumb: "480x480>" },
	 	default_url: "uploads/users/default/:style/default.png",
		path: "#{Rails.root}/public/uploads/users/:user_id/:style/:filename",
		url: "uploads/users/:user_id/:style/:filename"
	validates_attachment_content_type :profile, content_type: /\Aimage\/.*\z/
	
	Paperclip.interpolates :user_id  do |attachment, style|
	  attachment.instance.user_id
	end
	
	CURRENT_PROVIDER = %w(facebook google+)
	
	validates :user_name, presence: { message:"error_user_name_empty" }
	
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "error_register_email_invalid",allow_nil: true },
					  presence: { message:"error_email_empty" , :unless => :provider?},
					  uniqueness: {message:"error_register_email_registered", allow_nil: true}
					  
	validates :password, length: { if: :password_changed?, in: 8..30 , message: "error_user_password_format"}
	validates :password, confirmation: {message:"error_user_repeat_password_invalid",if: :password_changed?}
	
	validates :provider, inclusion: { message: "error_provider_not_support", :in => CURRENT_PROVIDER, :allow_nil => true }
	validates :provider_id, presence: { message:"error_provider_id_empty" , :if => :provider?},
						    uniqueness: { message:"error_provider_id_exists" , :if => :provider? }
	
	before_create do
		self.user_id = SecureRandom.hex(17)
	end

	before_save do
		if self.password_changed?
			self.password = Digest::MD5.hexdigest(self.password)
		end
	end
end
