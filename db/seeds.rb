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


i = 1
j = 1
sunny = Imdb::Serie.new("0472954")
until i > 11
  until j > sunny.season(i).episodes.size
    Show.find_by(id: 1).seasons.find_by(id: i).episodes.create(episode_number: j, title: sunny.season(i).episode(j).title, summary:sunny.season(i).episode(j).plot)
    j +=1
  end
  j = 1
  i +=1
end

office = Imdb::Serie.new("0386676")
Show.create(title: office.title, poster: office.poster)
i = 1
until i > office.seasons.size
  Show.find_by(title: office.title).seasons.create(season_number: i)
  i += 1
end
i = 1
j=1
until i > office.seasons.size
  until j > office.season(i).episodes.size
    Show.find_by(title: office.title).seasons.find_by(season_number: i).episodes.create(episode_number: j, title: office.season(i).episode(j).title, summary: office.season(i).episode(j).plot)
    j += 1
  end
  j = 1
  i += 1
end

