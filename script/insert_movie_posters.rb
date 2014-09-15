require_relative '../config/environment'
require 'json'
require 'open-uri'

i = 0
File.readlines('movie_poster_list.txt').each { |line|
  i += 1
  m = line.split(",")
  if m[0][0] =~ /[[:alpha:]]/
    next
  else
    if m[1].squish == ''
      mov = Movie.find(m[0]) 
      titleset = mov.title
      if titleset.include? ','
        new_title = titleset.split(',').reverse.join(' ').squish
        title = URI::encode(new_title)
        json_response = `curl -s http://www.omdbapi.com/?t=#{title}`
        begin
          parsed_response = JSON.parse(json_response)
        rescue Exception => e
          # puts "dropped"
          next
        end
        url = parsed_response['Poster']
        if url && url.length > 0 && url[0] == 'h'
          puts "#{mov.id},#{url}"
        end
        sleep(1.0/2.0)
      else
      end
    elsif m[1][0] == 'h'
      puts line
    end
  end
}
