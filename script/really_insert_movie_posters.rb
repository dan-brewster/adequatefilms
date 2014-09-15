require_relative '../config/environment'
require 'json'
require 'open-uri'

i = 0
File.readlines('final_poster_list.txt').each { |line|
  i += 1
  m = line.split(",")
  if m[0][0] =~ /[[:alpha:]]/
    next
  else
    movie = Movie.find(m[0])
    movie.poster_url = m[1]
    movie.save
    puts "Movie #{movie.title} #{movie.id} saved!"
  end
}
