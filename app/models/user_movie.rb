class UserMovie < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  attr_accessible :rating, :review, :like_count, :weight, :title, :watch_count, :watch_date
end
