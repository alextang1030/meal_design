Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'login#show', constraints: lambda { |cookies| !cookies[:user_token].present? }
  root 'home#index'
  
  # resources :home
  # get "home/profile"=> "home#profile"
  
  resources :login
  
  namespace :api do
	namespace 'v1' do
		
		scope :controller => "user", :path => "/users" do
			get "" => :get
			post "registration" => :registration
			post "login" => :login
			patch "" => :edit
			get "search" => :search
		end
		
		scope :controller => "event", :path => "/events" do
			get "" => :list
			get ":id"=> :get
			get ":id/gen" => :gen
			post ":id/confirm" => :confirm
			put "(:id)" => :edit
			patch ":id/:status" => :status
			delete ":id/leave" => :leave
			post ":id/users/add" => :add_users
			delete ":id/users/remove"=> :remove_users
			post ":id/restaurants/add" => :add_restaurants
			delete ":id/restaurants/remove" => :remove_restaurants
			delete ":id" => :delete
		end
		
		scope :controller => "history", :path => "/histories" do
			get "" => :list
		end
		
		scope :controller => "restaurant", :path => "/restaurants" do
			get "" => :list
			get ":id" => :get
		end
		
		scope :controller => "config", :path => "/config" do
			get "countries" => :countries
			get "states" => :states
			get "suburbs" => :suburbs
		end
		
		scope :controller => "group", :path => "/groups" do
			get "" => :list
			get ":id" => :get
			put "(:id)" => :edit
			post ":id/add" => :add_users
			post ":id/remove" => :remove_users
			delete ":id" => :delete
		end
		
		scope :controller => "favourite", :path => "/favourites" do
			get "" => :list
			post ":id" => :add
			delete ":id" => :delete
		end
		
		scope :controller => "blacklist", :path => "/blacklists" do
			get "" => :list
			post ":id" => :add
			delete ":id" => :delete
		end
	end
  end
end
