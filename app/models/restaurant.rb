class Restaurant < ApplicationRecord

	require 'securerandom'
	
	self.primary_key = "restaurant_id"
	
	has_many :reviews
	has_many :fav_lists
	has_many :black_lists
	has_many :event_restaurants
	
	belongs_to :suburb, foreign_key: "suburb_id"
	
	default_scope {where(deleted_flag:"N")}
	
	has_attached_file :image, styles: { thumb: "480x480>" },
	 	default_url: "uploads/restaurants/default/:style/default.png",
		path: "#{Rails.root}/public/uploads/restaurants/:restaurant_id/:style/:filename",
		url: "uploads/restaurants/:restaurant_id/:style/:filename"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	Paperclip.interpolates :restaurant_id  do |attachment, style|
	  attachment.instance.restaurant_id
	end
	
	validates :name, presence: { message:"error_group_name_empty" }
	
	before_create do
		self.restaurant_id = SecureRandom.hex(17)
	end
end
