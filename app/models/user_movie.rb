class UserMovie < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  attr_accessible :rating, :review, :like_count, :weight, :title, :watch_count, :watch_date, :user_id, :movie_id

  def self.create_with_update(params)
    logger.info params
    @um = UserMovie.new({movie_id: params['movie']['id'], user_id: params['user']['id']})
    logger.info @um
    if @um.save
      @u = Update.new({user_movie: @um})
      if @u.save
        UserMovie.last
      end
    end
  end

end
