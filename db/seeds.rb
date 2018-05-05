# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Country.create([
	{ code_name: "hong_king" }
])

State.create([
	{ country_id: Country.find_by({code_name: "hong_king"}).id, code_name: "hki" },
	{ country_id: Country.find_by({code_name: "hong_king"}).id, code_name: "kln" },
	{ country_id: Country.find_by({code_name: "hong_king"}).id, code_name: "nt" },
])

State.find_by({code_name: "kln"}).suburbs.create([
	{ country_id: Country.find_by({code_name: "hong_king"}).id  ,code_name: "kt" },
])

case Rails.env
when "development"
   Suburb.find_by({code_name: "kt"}).restaurants.create([
	  {"name": "The Stadium","address": "觀塘興業街4號The Wave 4樓" },
	  {"name": "小火焰韓式咖啡餐廳 Aidan Korean Dessert Cafe","address": "觀塘觀塘道410號觀點中心1樓1號舖" },
	  {"name": "Manhattan Grill & Bar","address": "觀塘觀塘道414號一亞太中心(OPC)3樓303號舖" },
	  {"name": "御前大江戶日式料理 Gozen EDO Japanese Restaurant","address": "觀塘觀塘道414號1亞太中心8樓" },
	  {"name": "K2 Kitchen","address": "觀塘巧明街106號冠力工業大廈13樓6室" },
	  {"name": "i kitchen","address": "觀塘巧明街106號冠力工業大廈201室" },
	  {"name": "極尚大瀛喜日本料理 Deluxe Daieiki Japanese Restaurant","address": "觀塘觀塘道414號1亞太中心5樓" },
	  {"name": "新蒸武門 Zingmomoon","address": "觀塘開源道60號駱駝漆大廈3座1樓Q室" },
	  {"name": "The BASE","address": "觀塘開源道52-54號豐利中心5樓509室" },
	  {"name": "小時光 Scoool Cafe","address": "觀塘興業街18號美興工業大廈A座1樓C室" },
	  {"name": "阿元來了 Yuan Is Here","address": "觀塘鴻圖道28號地下後座" },
	  {"name": "Mela Italian & Spanish Cuisine","address": "觀塘巧明街94號鴻圖中心地下5D號舖" },
	  {"name": "Coffee Art","address": "觀塘成業街7號東廣場地下G46-G48舖" },
	  {"name": "1988","address": "觀塘興業街16-18號美興工業大廈A座1樓A3室" },
	  {"name": "龍城冰室 Dragon City Cafe","address": "觀塘駿業街56號中海日升中心地下A號舖" },
	  {"name": "Mini Friday","address": "觀塘興業街4號The Wave 3樓" },
	  {"name": "古今二 KOKON2","address": "觀塘觀塘道436-446號官塘工業中心4期1樓B室" },
	  {"name": "Add Some Thai Restaurant","address": "觀塘開源道62號駱駝漆大廈一座9樓D室" },
	  {"name": "高興 Happinesssss Cafe","address": "觀塘成業街19-23號成業工業大廈地下2號舖" },
	  {"name": "哈豆 Doctor Beans","address": "觀塘成業街19號成業工業大廈2樓29室" },	
	  {"name": "No.9 Bistro","address": "觀塘開源道71號王子大廈9樓A室" },
	  {"name": "Bella Shine","address": "觀塘巧明街114號迅達工業大廈2樓B室" },
	  {"name": "Fish & Chick Plus","address": "觀塘觀塘道414號1亞太中心(OPC)3樓302號舖" },
	  {"name": "JK Brother's","address": "觀塘開源道54號豐利中心5樓507室" },
	  {"name": "My Burger","address": "觀塘成業街7號東廣場地下G12-13號舖" },
	  {"name": "B.Two House","address": "觀塘成業街19-21號成業工業大廈1樓26室" },
	  {"name": "Aster Cafe","address": "觀塘巧明街117號港貿中心2樓201室" },
	  {"name": "KC Cafe","address": "觀塘成業街6號泓富廣場2706-10室" },
	  {"name": "Factory 99","address": "觀塘巧明街99號巧明工廠大廈1樓A室" },
	  {"name": "拿督星馬大飯店","address": "觀塘海濱道190號觀塘碼頭熟食市場1樓20號舖" },
	  {"name": "Bold Italic","address": "觀塘開源道60號駱駝漆大廈3座3樓P室" },
	  {"name": "金記冰室 Kam Kee Cafe","address": "觀塘觀塘道418號創紀之城五期(apm)6樓L6-1a &2號舖" },
	  {"name": "米拉 Milá","address": "觀塘成業街7號東廣場地下45號舖" },
	  {"name": "Bro's Cuisine","address": "觀塘成業街19-21號成業工業大廈2樓13室" },
	  {"name": "Sunprime Cafe","address": "觀塘成業街19-21號成業工業大廈1樓06室" },
	  {"name": "丼丼屋食堂 Dondonya Shokudo","address": "觀塘觀塘道418號創紀之城五期(apm)6樓L6-3b號舖" },
	  {"name": "La. Tomokuo Japanese & Western Cuisine","address": "觀塘駿業街56號中海日升中心1樓G舖" },
	  {"name": "八一0四生活盒子 8104 A Box Of Life","address": "觀塘成業街19-21號成業工業大廈1樓04室" },
	  {"name": "紅茶冰室 Red Tea Cafe","address": "觀塘駿業街56號地下" },
	  {"name": "臻味豬扒酸辣米線","address": "觀塘聯安街9-15號永毅大樓地下C舖" },
	  {"name": "Pasta Zone","address": "觀塘開源道60號駱駝漆大廈3期1樓J室" },
	  {"name": "漢和韓國料理 Hon Wo Korean Restaurant","address": "觀塘觀塘觀塘道414號1亞太中心9字樓" },
	  {"name": "Little Mario’s Pizzeria","address": "觀塘開源道60號駱駝漆大廈3座4樓U01室" },
	  {"name": "Parc古道具公園 Parc Antique & Lifestyle","address": "觀塘鴻圖道60號鴻福工廠大廈10樓B2號舖" },
	  {"name": "鰹烏冬 Katsuo Udon","address": "觀塘開源道60號駱駝漆大廈3期11樓J室" },
	  {"name": "海潮食堂 Hoi Chiu Canteen","address": "觀塘成業街19-21 號成業工業大廈地下G6 號舖" },
	  {"name": "山田海韓國料理","address": "觀塘開源道60號駱駝漆大廈三座3樓U室" },
	  {"name": "哈豆 Doctor Beans","address": "觀塘駿業里6號富利工業大廈3樓A室" },
	  {"name": "完美煮意 Tasicious Cafe","address": "觀塘駿業里6號富利工業大廈3樓B室" },
	  {"name": "茶木‧台式休閒餐廳 TeaWood Taiwanese Cafe & Restaurant","address": "觀塘觀塘道418號創紀之城五期(apm)4樓L4-19號舖" },
	  {"name": "翔龍拉麵小籠包 Cheung Lung Restaurant","address": "觀塘觀塘道414號1亞太中心3樓" },
	  {"name": "Tasty Fabio","address": "觀塘開源道60號駱駝漆大厦三期9樓T室" },
	  {"name": "小廚港作 Rocoma Kitchen","address": "觀塘成業街10號1樓C舖" },
	  {"name": "居食屋「和民」 Watami Japanese Casual Restaurant","address": "觀塘觀塘道414號1亞太中心2樓203號舖" },
	  {"name": "Pepper Lunch","address": "觀塘觀塘道414號1亞太中心2樓202號舖" },
	  {"name": "叁拾咖啡室","address": "觀塘成業街30號地舖" },
	  {"name": "小伊甸 Little Eden","address": "觀塘官塘道436-446號官塘工業中心第四期1樓C室" },
	  {"name": "米線陣 Mixian Sense","address": "觀塘開源道79號鱷魚恤中心1樓8號舖" },
	  {"name": "米線工房","address": "觀塘成業街10號電訊一代廣場1樓A號舖" },
	  {"name": "味山田 Aji Yamada","address": "觀塘成業街7號東廣場地下G08舖" },
	  {"name": "PP Cafe","address": "觀塘巧明街119-121號年運工業大廈地下A舖" },
	  {"name": "Phytisserie","address": "觀塘成業街6號泓富廣場 306室" },
	  {"name": "理想點 Ideal Dim Sum","address": "觀塘鴻圖道83號東瀛遊廣場地下2號舖" },
	  {"name": "珠記冰室","address": "觀塘開源道46-48號威利廣場地下2-3號舖" }
	])
   
   User.create([
	{ email: "alex.tang@vicosys.com.hk" , password: "abcd1234" ,user_name: "Alex Tang"},
	{ email: "king.wong@vicosys.com.hk" , password: "abcd1234" ,user_name: "King Wong"},
	{ email: "eva.chung@vicosys.com.hk" , password: "abcd1234" ,user_name: "Eva Chung"},
	{ email: "chenug.chenug@vicosys.com.hk" , password: "abcd1234" ,user_name: "Cheung Cheung"},
	{ email: "brian.li@vicosys.com.hk" , password: "abcd1234" ,user_name: "Brian Li"},
	{ email: "william.ho@vicosys.com.hk" , password: "abcd1234" ,user_name: "William Ho"},
	{ email: "john.sin@vicosys.com.hk" , password: "abcd1234" ,user_name: "John sin"},
	{ email: "travis.mok@vicosys.com.hk" , password: "abcd1234" ,user_name: "Travis Mok"},
	{ email: "xiaoling.lin@vicosys.com.hk" , password: "abcd1234" ,user_name: "Iris Ling"},
	{ email: "terence.chan@vicosys.com.hk" , password: "abcd1234" ,user_name: "Terence Chan"},
	{ email: "nicole.tsui@vicosys.com.hk" , password: "abcd1234" ,user_name: "Nicole tsui"},
	{ email: "kelvin.yu@vicosys.com.hk" , password: "abcd1234" ,user_name: "Kelvin Yu"},
	{ email: "ch.lok@vicosys.com.hk" , password: "abcd1234" ,user_name: "Lok"},
	{ email: "otis.kong@vicosys.com.hk" , password: "abcd1234" ,user_name: "Otis Kong"},
   ])
   
   User.find_by({email: "travis.mok@vicosys.com.hk" }).black_lists.create([
		{ restaurant_id: Restaurant.find_by({ name: "山田海韓國料理" }).restaurant_id},
   ])
   
   User.find_by({email: "alex.tang@vicosys.com.hk" }).black_lists.create([
		{ restaurant_id: Restaurant.find_by({ name: "金記冰室 Kam Kee Cafe" }).restaurant_id},
   ])
   
   User.find_by({email: "william.ho@vicosys.com.hk" }).black_lists.create([
		{ restaurant_id: Restaurant.find_by({ name: "Fish & Chick Plus" }).restaurant_id},
		{ restaurant_id: Restaurant.find_by({ name: "Bold Italic" }).restaurant_id},
   ])
   
   User.find_by({email: "alex.tang@vicosys.com.hk"}).user_login_tokens.create([
		user_ip: "0.0.0.0", user_agent:"Chrome"
   ])
   User.find_by({email: "alex.tang@vicosys.com.hk"}).user_groups.create([
		{ group_name: "Vicosys Lunch Group"}
   ])
   
   
   User.find_by({email: "alex.tang@vicosys.com.hk"}).user_groups.find(1).user_group_members.create(User.find_each.map{|user|
	if user.email == "alex.tang@vicosys.com.hk"
		{ user_id: user.user_id , user_role: "admin" }
	else
		{ user_id: user.user_id }
	end
   })
   
   User.find_by({email: "alex.tang@vicosys.com.hk"}).events.create([
	{ event_name: "Daily Lunch"}
   ])
   
   User.find_by({email: "alex.tang@vicosys.com.hk"}).events.find(1).event_invites.create(User.find_each.map{|user|
	{ user_id: user.user_id , status: "attend" }
   })
   
   User.find_by({email: "alex.tang@vicosys.com.hk"}).events.find(1).event_restaurants.create(Restaurant.find_each.map{|restaurant|
	{
		user_id: User.find_by({email: "alex.tang@vicosys.com.hk"}).user_id,
		restaurant_id: restaurant.restaurant_id
	}
   })
  
when "production"
   
end