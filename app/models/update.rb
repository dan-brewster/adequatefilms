class Update < ActiveRecord::Base
  belongs_to :user_movie
  attr_accessible :user_movie
end
