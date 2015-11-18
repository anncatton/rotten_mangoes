# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Movie.create!(
#   title: "The Wizard of Oz",
#   director: "Laurence of Arabia",
#   runtime_in_minutes: 123,
#   poster_image_url: "www.movies.com",
#   release_date: Date.today,
#   description: <<-eos.gsub(/\s+/, " ").strip
#   A young girl travels to a strange land and 
#   kills the first person she meets. She then 
#   teams up with 2 others to kill again.
#   eos
# )

# Movie.create!(
#   title: "Sharknado 3",
#   director: "Jason Priestley",
#   runtime_in_minutes: 63,
#   poster_image_url: "www.movies.com",
#   release_date: Date.today,
#   description: "More sharks. Same amount of tornadoes."
# )

# Movie.create!(
#   title: "Laurence of Arabia",
#   director: "Wizard of Oz",
#   runtime_in_minutes: 345,
#   poster_image_url: "www.movies.com",
#   release_date: Date.today,
#   description: <<-eos.gsub(/\s+/, " ").strip
#   Laurence of Arabia travels to a strange land
#   and doesn't kill anyone. What a nice guy!
#   eos
# )

# Movie.create!(
#   title: "Unbreakable",
#   director: "Scary movie guy",
#   runtime_in_minutes: 145,
#   poster_image_url: "www.movies.com",
#   release_date: Date.today,
#   description: <<-eos.gsub(/\s+/, " ").strip
#   Samuel L. Jackson follows Bruce Willis
#   around and says bizarre things to him.
#   eos
# )


30.times do
  User.create!(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    admin: false
    )
end

10.times do
  User.create!(
  firstname: Faker::Name.first_name,
  lastname: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "password",
  password_confirmation: "password",
  admin: true
  )
end
