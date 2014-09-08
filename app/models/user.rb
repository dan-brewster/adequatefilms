class User < ActiveRecord::Base
  has_many :user_movies
  has_many :movies, :through => :user_movies
  attr_accessible :description, :location, :name
end
