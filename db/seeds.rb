
Message.destroy_all
Chatroom.destroy_all
Comment.destroy_all
Post.destroy_all
Category.destroy_all
User.destroy_all
Neighbourhood.destroy_all

# Guerrique's seeds-----------------------------------------------------------
#uncomment if want to use
# puts 'clearing data'

# Post.destroy_all
# User.destroy_all
# Neighbourhood.destroy_all

# puts 'creating neighbourhood'
# depijp = Neighbourhood.create!(name: 'De Pijp')

# puts 'creating users'
# julia = User.create!(first_name: 'Julia', last_name: 'Jonker', email: "julia@karma.com",
#   password: "julia!", neighbourhood_id: depijp.id,
#   upload_avatar: File.open(Rails.root.join('db/fixtures/julia.jpg')))
# norman = User.create!(first_name: 'Norman', last_name: 'Hennis', email: "norman@karma.com",
#   password: "norman!", neighbourhood_id: depijp.id,
#   upload_avatar: File.open(Rails.root.join('db/fixtures/norman.jpg')))
# patrick = User.create!(first_name: 'Patrick', last_name: 'Stellinga', email: "patrick@karma.com",
#   password: "patrick!", neighbourhood_id: depijp.id,
#   upload_avatar: File.open(Rails.root.join('db/fixtures/patrick.jpg')))
# susan = User.create!(first_name: 'Susan', last_name: 'Roosen', email: "susan@karma.com",
#   password: "susan!", neighbourhood_id: depijp.id,
#   upload_avatar: File.open(Rails.root.join('db/fixtures/susan.jpg')))

# puts 'creating posts'
# post_1 = Post.create!(title: 'I would like some help with my garden', description: 'Hello wonderful neighbours,
#   I have some trees in my garden that need some trimming, but the tools are too heavy for me. It should not take
#   more than half an hour.', category: 'Looking for a hand', address: 'Tweede van der Helststraat 3, 1073 AE Amsterdam',
#   user_id: susan.id)
# post_2 = Post.create!(title: 'Math classes', description: "Hey all,
#   I am studying at university at the moment, but I have a lot of free time. I'd be happy to give one or
#   two math classes every week to the kids who might need them.", category: 'Help offered', address: 'Eerste van der Helststraat 37, 1073 AC Amsterdam',
#   user_id: norman.id)
# post_3 = Post.create!(title: 'Any cat lovers around?', description: "Good morning everyone. I have
#   to leave this weekend, and my roommate doesn't like cat much, so I was wondering if one of my wonderful
#   neighbours would agree to take my kitty home this weekend? I will provide everything needed", category: 'Animals', address: 'Van Woustraat 130, 1073 LT Amsterdam',
#   user_id: julia.id)
# post_4 = Post.create!(title: 'Anybody needs a ride to Ikea ?', description: "Hey fam, I am planning to go to Ikea
#   this week-end. I'm going there with my truck, I just have to buy a few things, so if someone needs that
#   extra space, next week-end is the time!", category: 'Help offered', address: 'Cornelis Troostplein 21, 1072 JJ Amsterdam',
#   user_id: patrick.id)

# puts 'Finished!'

# Lea's seeds-------------------------------------------

neighbourhoods = ["Amsterdam", "Oud-Zuid", "De Pijp", "Rivierenbuurt", "Buitenveldert", "Zuidas"]

puts "CREATING NEIGHBOURHOODS"
neighbourhoods.each do |name|
  Neighbourhood.create(name: name)
end

categories = ["Gardening","Need a ride", "Odd jobs", "Pet sitting", "Lend a hand", "Others"]

Category.create(name: "Gardening", color: "rgba(114,203,158,0.8)", icon: "garden.png")
Category.create(name: "Need a ride", color: "rgba(134,187,216,0.8)", icon: "ride.png")
Category.create(name: "Odd jobs", color: "rgba(181,172,146,0.8)", icon: "odd.png")
Category.create(name: "Pet sitting", color: "rgba(238,96,85,0.8)", icon: "pet.png")
Category.create(name: "Lend a hand", color: "rgba(244,211,94,0.8)", icon: "hand.png")
Category.create(name: "Others", color: "#D6D1B1", icon: "others.png")

[15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1].each do |item|
	user_data = YAML.load_file("db/data/user#{item}.yml")

puts "CREATING USER"
	user = User.new(
		first_name: user_data["first_name"],
    password: "hello!",
		# password: "hello#{rand(1..1000)}",
		last_name: user_data["last_name"],
		email: user_data["email"],
		personal_info: user_data["personal_info"],
    karma_points: user_data["karma_points"],
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
	    user: user,
      category: Category.find_by_name(post_data["category"])
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
