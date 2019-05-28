# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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
