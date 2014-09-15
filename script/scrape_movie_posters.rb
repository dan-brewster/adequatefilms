require_relative '../config/environment'
require 'json'
require 'open-uri'

j = 0
Movie.where("id < ? and id > ?", 48597, 30346).each do |m|
  if m.fav_count > 1000
    title = URI::encode(m.title)
    json_response = `curl -s http://www.omdbapi.com/?t=#{title}`
    begin
      parsed_response = JSON.parse(json_response)
    rescue Exception => e
      puts "dropped"
      next
    end
    url = parsed_response['Poster']
    puts "#{m.id},#{url}"
    j += 1
    sleep(1.0/2.0)
  end
end    
