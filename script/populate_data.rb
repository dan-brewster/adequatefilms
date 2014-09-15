# encoding: utf-8
require_relative '../config/environment'
require 'faker'

i = 0
File.readlines('movies.txt').each { |m|
  i += 1
  m = m.split("\t")
  n = Movie.new(title: m[0].delete('"').encode('UTF-8'), pub_date: Date.parse("#{m[1]}-01-01 00:00:00"), length: m[2], rating: m[3], fav_count: m[4], description: Faker::Lorem.paragraph(2)) 
  n.save
  puts "Saved: #{Movie.last.title}"
}
