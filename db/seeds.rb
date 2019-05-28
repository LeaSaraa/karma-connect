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


neighborhoods = ["Amsterdam", "Oud-Zuid", "De Pijp", "Rivierenbuurt", "Buitenveldert", "Zuidas"]

neighborhoods.each do |name|
  # Neighborhood.create(name: name)
  puts name
end

  [1, 2].each do |item|
  user = YAML.load_file("db/data/user#{item}.yml")
  p user["first_name"]
    p user["last_name"]

  user["posts"].each do |post|
  	p post["description"]
  end
  # User.new(
  #   first_name: user[:first_name],
  #   last_name: user[:last_name],
  #   email: user[:email],
  #   upload_avatar: user[:upload_avatar],
  #   personal_info: user[:personal_info],
  #   neighborhood: Neighborhood.find_by_name(user[:neighborhood]
  #   )
  #   user.save
  end

