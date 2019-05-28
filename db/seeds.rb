Neighbourhood.destroy_all
User.destroy_all
Post.destroy_all

neighbourhoods = ["Amsterdam", "Oud-Zuid", "De Pijp", "Rivierenbuurt", "Buitenveldert", "Zuidas"]

puts "CREATING NEIGHBOURHOODS"
neighbourhoods.each do |name|
  Neighbourhood.create(name: name)
end

puts "STARTING USER DATA SET CREATION"
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each do |item|
	user_data = YAML.load_file("db/data/user#{item}.yml")

puts "CREATING USER"
	user = User.new(
		first_name: user_data["first_name"],
		password: "hello#{rand(1..1000)}",
		last_name: user_data["last_name"],
		email: user_data["email"],
		personal_info: user_data["personal_info"],
		neighbourhood: Neighbourhood.find_by_name(user_data["neighbourhood"])
	)
	user.remote_upload_avatar_url = user_data["upload_avatar"]
	user.save!

puts "CREATING POSTS"
	user_data["posts"].each do |post_data|
	  post = Post.new(
	    title: post_data["title"],
	    address: post_data["address"],
	    description: post_data["description"],
	    picture: post_data["picture"],
	    user: user
	    )
		post.save!

		unless post_data["compliments"].nil?
			puts "CREATING COMPLIMENTS"
			post_data["compliments"].each do |compliment_data|
			  compliment = Compliment.new(
				text: compliment_data["text"],
				points: compliment_data["points"].to_i,
				user: (User.all.shuffle - [user]).first,
				post: post
				)
			  	post.remote_picture_url = post_data["picture"]
				compliment.save!
			end
		end
	end
end
