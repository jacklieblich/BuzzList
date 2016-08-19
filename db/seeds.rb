# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#family guy, curb, sunny, office, rick and morty, south park, entourage, bojack, archer, game of thrones, breaking bad
serieses = ['0182576', '0264235', '0472954', '0386676', '2861424', '0121955', '0387199', '3398228', '1486217', '0944947', '0903747']

serieses.each do |series|
  imdb_show = Imdb::Serie.new(series)
  show = Show.create(title: imdb_show.title.chomp('"').reverse.chomp('"').reverse, poster: imdb_show.poster)
  i = 1
  until i > imdb_show.seasons.size
    show.seasons.create(season_number: i)
    i += 1
    if show.title == "Family Guy" && i == 15
      i = 17
    end
    if show.title == "South Park" && i == 20
      i = 24
    end
    if show.title == "BoJack Horseman" && i == 4
      i = 5
    end
    if show.title == "Archer" && i == 8
      i = 11
    end
    if show.title == "Game of Thrones" && i == 7
      i = 9
    end
    if show.title == "Curb Your Enthusiasm" && i == 9
      i = 10
    end
    if show.title == "It's Always Sunny in Philadelphia" && i == 12
      i = 15
    end
    if show.title == "Rick and Morty" && i == 3
      i = 4
    end
  end
  i = 1
  j = 1
  until i > show.seasons.count
    season_episodes = imdb_show.season(i).episodes.size
    if i == 1 && (show.title == "Family Guy" || show.title == "South Park" || show.title == "Archer")
      j = 0
      season_episodes -= 1
    end
    until j > season_episodes
      puts i
      puts j
      show.seasons.find_by(season_number: i).episodes.create(episode_number: j, title: imdb_show.season(i).episode(j).title, summary: imdb_show.season(i).episode(j).plot)
      j += 1
    end
    j = 1
    i += 1
  end
end
