class Person < ActiveRecord::Base
  has_many :roles
  attr_accessible :bio, :birthdate, :deathdate, :name
end
