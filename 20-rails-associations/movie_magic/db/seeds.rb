# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all
User.destroy_all
Review.destroy_all

res = RestClient.get("https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['MOVIE_API']}")
res_body = res.body
movies = JSON.parse(res_body)


movies["results"].each do |movie|
  Movie.create(
    title: movie["title"], 
    vote_average: movie["vote_average"], 
    vote_count: movie["vote_count"],
    overview: movie["overview"], 
    image_url: "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}", 
    release_year: movie["release_date"].split("-")[0].to_i
  )
end 





users = [
  {name: "Alison Quaglia", img_url: "https://ca.slack-edge.com/T02MD9XTF-UR5HZ0N4R-3a8789d5ca64-512"},
  {name: "Angelo Poole", img_url: "https://ca.slack-edge.com/T02MD9XTF-UR22FU3JP-f5621415bb08-512"},
  {name: "Annie Liao", img_url: "https://ca.slack-edge.com/T02MD9XTF-UR5HZ1E6M-5342f93026b1-512"},
  {name: "David Cha", img_url: "https://ca.slack-edge.com/T02MD9XTF-URDG744DN-8c33b8a907e6-512"},
  {name: "Ian Hollander", img_url: "https://ca.slack-edge.com/T02MD9XTF-UD54WDGFP-90d4735fb909-512"},
  {name: "Kevin Gleeson", img_url: "https://ca.slack-edge.com/T02MD9XTF-URDG7620Y-1f912f45a62a-512"},
  {name: "Michelle Pathe", img_url: "https://ca.slack-edge.com/T02MD9XTF-U9C1QTFPC-d10ffd32102f-512"},
  {name: "Monsur Khan", img_url: "https://ca.slack-edge.com/T02MD9XTF-UQ848M9JN-b23790346dc4-512"},
  {name: "Otha Hernandez", img_url: "https://ca.slack-edge.com/T02MD9XTF-UJ98VJZ2M-ecb76a82da04-512"},
  {name: "Red Bahi", img_url: "https://ca.slack-edge.com/T02MD9XTF-URD2SUU04-1b746fb1550a-512"},
  {name: "Randy Herasme", img_url: "https://ca.slack-edge.com/T02MD9XTF-UD452FLU9-bad871361d20-512"},
  {name: "Sean Welsh Brown", img_url: "https://ca.slack-edge.com/T02MD9XTF-UR0NMQM42-034fb56f3580-512"},
  {name: "Shaq Clarke", img_url: "https://ca.slack-edge.com/T02MD9XTF-UR0NMQVA6-eba5c789002b-512"},
  {name: "Gracie McGuire", img_url: "https://ca.slack-edge.com/T02MD9XTF-UD5PW68JW-f90e84fbb445-512"},
  {name: "Elizabeth Kim", img_url: "https://ca.slack-edge.com/T02MD9XTF-UR0NMMF8S-2ddd9542afe0-512"},
  {name: "Summer Rizzo", img_url: "https://ca.slack-edge.com/T02MD9XTF-UR22G3D7D-5b7b5152272d-512"},
  {name: "Tom Donovan", img_url: "https://ca.slack-edge.com/T02MD9XTF-URFC3EV39-48f428b0b8a8-512"},
  {name: "Mazen Al Swar", img_url: "https://ca.slack-edge.com/T02MD9XTF-UFKMPLPQ8-a306271a419d-512"}
]

users.each do |user| 
  User.create(user)
end



20.times do
  Review.create(user: User.all.sample, movie: Movie.all.sample, rating: rand(1..10),  content: Faker::Movie.quote)
end