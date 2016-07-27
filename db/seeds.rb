# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Show.create(title:"It's Always Sunny in Philadelphia", poster: "http://www.impawards.com/tv/posters/its_always_sunny_in_philadelphia_ver5_xlg.jpg")

for i in 1..11
  Show.find_by(id:1).seasons.create(season_number: i)
end