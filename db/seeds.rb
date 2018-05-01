# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Country.create([
	{ code_name: "hong_kong" }
])

State.create([
	{ country_id: Country.find_by({code_name: "hong_kong"}).id, code_name: "hki" },
	{ country_id: Country.find_by({code_name: "hong_kong"}).id, code_name: "kln" },
	{ country_id: Country.find_by({code_name: "hong_kong"}).id, code_name: "nt" },
])

State.find_by({code_name: "kln"}).suburbs.create([
	{ country_id: Country.find_by({code_name: "hong_kong"}).id  ,code_name: "kt" },
])

case Rails.env
when "development"
   Suburb.find_by({code_name: "kt"}).restaurants.create([
		{ name: "小廚港作" },
		{ name: "三十" },
		{ name: "五樓(日本野)" },
		{ name: "漢和" },
		{ name: "九樓西餐" },
		{ name: "山田海" },
		{ name: "Factory 99" },
		{ name: "珠記" },
		{ name: "小時光" },
		{ name: "蒸武門" },
		{ name: "拿督" },
		{ name: "My Burger" },
		{ name: "牛腩麵(海福)" },
		{ name: "小伊甸" },
		{ name: "古今一" }
   ])
   
   User.create([
	{ email: "alex.tang@dev.com.hk" , password: "abcd1234" ,user_name: "Alex Tang"},
	{ email: "kong.wong@dev.com.hk" , password: "abcd1234" ,user_name: "Kong Wong"},
	{ email: "eva.chung@dev.com.hk" , password: "abcd1234" ,user_name: "Eva Chung"},
   ])
   
   User.find_by({email: "alex.tang@dev.com.hk"}).user_login_tokens.create([
		user_ip: "0.0.0.0", user_agent:"Chrome"
   ])
   User.find_by({email: "alex.tang@dev.com.hk"}).user_groups.create([
		{ group_name: "lunch group!"}
   ])
   
   User.find_by({email: "alex.tang@dev.com.hk"}).user_groups.find(1).user_group_members.create([
	{ user_id: User.find_by({email: "alex.tang@dev.com.hk"}).user_id , user_role: "admin" },
	{ user_id: User.find_by({email: "kong.wong@dev.com.hk"}).user_id },
	{ user_id: User.find_by({email: "eva.chung@dev.com.hk"}).user_id }
   ])
   
   User.find_by({email: "alex.tang@dev.com.hk"}).events.create([
	{ event_name: "Daily Lunch"}
   ])
   
   User.find_by({email: "alex.tang@dev.com.hk"}).events.find(1).event_invites.create([
	{ user_id: User.find_by({email: "alex.tang@dev.com.hk"}).user_id , status: "attend" },
	{ user_id: User.find_by({email: "kong.wong@dev.com.hk"}).user_id },
	{ user_id: User.find_by({email: "eva.chung@dev.com.hk"}).user_id }
   ])
   
   User.find_by({email: "alex.tang@dev.com.hk"}).events.find(1).event_restaurants.create([
	{ user_id: User.find_by({email: "alex.tang@dev.com.hk"}).user_id , restaurant_id: Restaurant.find_by({ name: "小廚港作" }).restaurant_id},
	{ user_id: User.find_by({email: "alex.tang@dev.com.hk"}).user_id , restaurant_id: Restaurant.find_by({ name: "三十" }).restaurant_id},
	{ user_id: User.find_by({email: "alex.tang@dev.com.hk"}).user_id , restaurant_id: Restaurant.find_by({ name: "五樓(日本野)" }).restaurant_id},
	{ user_id: User.find_by({email: "alex.tang@dev.com.hk"}).user_id , restaurant_id: Restaurant.find_by({ name: "漢和" }).restaurant_id},
	{ user_id: User.find_by({email: "alex.tang@dev.com.hk"}).user_id , restaurant_id: Restaurant.find_by({ name: "九樓西餐" }).restaurant_id},
	{ user_id: User.find_by({email: "alex.tang@dev.com.hk"}).user_id , restaurant_id: Restaurant.find_by({ name: "山田海" }).restaurant_id},
	{ user_id: User.find_by({email: "alex.tang@dev.com.hk"}).user_id , restaurant_id: Restaurant.find_by({ name: "Factory 99" }).restaurant_id},
	{ user_id: User.find_by({email: "alex.tang@dev.com.hk"}).user_id , restaurant_id: Restaurant.find_by({ name: "珠記" }).restaurant_id},
	{ user_id: User.find_by({email: "alex.tang@dev.com.hk"}).user_id , restaurant_id: Restaurant.find_by({ name: "小時光" }).restaurant_id},
	{ user_id: User.find_by({email: "alex.tang@dev.com.hk"}).user_id , restaurant_id: Restaurant.find_by({ name: "蒸武門" }).restaurant_id},
	{ user_id: User.find_by({email: "alex.tang@dev.com.hk"}).user_id , restaurant_id: Restaurant.find_by({ name: "拿督" }).restaurant_id},
	{ user_id: User.find_by({email: "alex.tang@dev.com.hk"}).user_id , restaurant_id: Restaurant.find_by({ name: "My Burger" }).restaurant_id}
   ])
   
   User.find_by({email: "alex.tang@dev.com.hk"}).fav_lists.create([
		{ restaurant_id: Restaurant.find_by({ name: "山田海" }).restaurant_id},
   ])
   
   User.find_by({email: "alex.tang@dev.com.hk"}).black_lists.create([
		{ restaurant_id: Restaurant.find_by({ name: "拿督" }).restaurant_id},
   ])
   
   User.find_by({email: "alex.tang@dev.com.hk"}).user_histories.create([
	{event_id: 1, restaurant_id: Restaurant.find_by({ name: "漢和" }).restaurant_id }
   ])
   
   Restaurant.find_by({ name: "五樓(日本野)" }).reviews.create([
	{ user_id: User.find_by({email: "alex.tang@dev.com.hk"}).user_id , stars: 5 }
   ])
when "production"
   
end