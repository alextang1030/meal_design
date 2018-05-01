Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :api do
	namespace :vi do
		
		scope :controller => "user", :path => "/users" do
			get "" => :get
			post "registration" => :registration
			post "login" => :login
			patch "" => :edit
		end
		
		scope :controller => "event", :path => "/events" do
			get "" => :list
			get ":id"=> :get
			put "(:id)" => :edit
			delete ":id" => :delete
			post "users/add" => :add_users
			post "users/remove"=> :remove_users
			post "restaurants/add" => :add_restaurants
			post "restaurants/remove" => :remove_restaurants
			delete ":id" => :delete
		end
		
		scope :controller => "history", :path => "/histories" do
			get "" => :list
			get ":id" => :get
		end
		
		scope :controller => "restaurant", :path => "/restaurants" do
			get "" => :list
			get ":id" => :get
		end
		
		scope :controller => "countries", :path => "/countries" do
			get "" => :list
			get ":id" => :get
		end
		
		scope :controller => "states", :path => "/states" do
			get "" => :list
			get ":id" => :get
		end
		
		scope :controller => "suburbs", :path => "/suburbs" do
			get "" => :list
			get ":id" => :get
		end
		
		scope :controller => "group", :path => "/groups" do
			get "" => :list
			get ":id" => :get
			put "(:id)" => :edit
			post "add/:id" => :add_users
			delete ":id" => :delete
		end
		
		scope :controller => "favourite", :path => "/favourites" do
			get "" => :list
			get ":id" => :get
			post ":id" => :add
			delete ":id" => :delete
		end
		
		scope :controller => "blacklist", :path => "/blacklists" do
			get "" => :list
			get ":id" => :get
			post ":id" => :add
			delete ":id" => :delete
		end
	end
  end
end
