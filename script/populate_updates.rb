require_relative '../config/environment'
require 'faker'

20000.times do
  if rand(100) == 1
    user_id = 1
  else
    user_id = rand(1000) + 1
  end
  m = Movie.find(rand(58788) + 1)
  puts "Movie: #{m.title}"
  while m.fav_count < 1000
    m = Movie.find(rand(58788) + 1)
    puts "Movie(2): #{m.title}"
    if m.fav_count < 10000 && rand(2) == 1
      m = Movie.find(rand(58788) + 1)
      "Movie(3): #{m.title}"
    end
  end
  puts "SELECTED #{m.inspect}"
  mu = UserMovie.new(movie: m, user: User.find(user_id), rating: 1 + rand(9), review: Faker::Lorem.paragraph(3), like_count: rand(5), weight: 0, title: Faker::Company.catch_phrase, watch_count: rand(3), watch_date: Time.at(Time.now - 10.years + rand * (Time.now.to_f - (Time.now - 10.years).to_f)))
  mu.save
  mu.updated_at = Time.at(Time.now - 10.years + rand * (Time.now.to_f - (Time.now - 10.years).to_f))
  mu.created_at = mu.updated_at
  mu.save
  up = Update.new(user_movie: mu)
  up.save
  up.updated_at = mu.updated_at
  up.created_at = mu.updated_at
  up.save
end
