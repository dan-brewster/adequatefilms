class Movie < ActiveRecord::Base
  has_many :user_movies
  has_many :users, :through => :user_movies
  attr_accessible :description, :pub_date, :rating, :title, :fav_count, :length, :poster_url
end
