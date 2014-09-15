require_relative '../config/environment'
require 'faker'

1000.times do 
  u = User.new(name: Faker::Name.name, description: Faker::Name.title, location: "#{Faker::Address.city} #{Faker::Address.state}")
  u.save
end
