class UserMovieController < ApplicationController
  respond_to :json, :html

  # def add
  #   respond_with UserMovie.create(params.require(:user, :movie).permit(:rating, :review))
  # end

  def index
  end

  def for_movie
    @user_movies = UserMovie.where(:movie_id => params[:id])
    respond_to do |format|
      format.html { render json: @user_movies.to_json }
      format.json { render json: @user_movies.to_json }
    end
  end

  def required_params
    params.require('movie')
    #params.require('user')
  end

  def create
    logger.info "create"
    logger.info params
    respond_with UserMovie.create_with_update(params)
  end

  def destroy
    logger.info "destroy"
    logger.info params
    # TODO -- find appropriate update and delete if appropriate
    respond_with UserMovie.delete(params[:id])
  end


  def list
    @user_movies = UserMovie.where(:user_id => 1)
    respond_to do |format|
      format.html { render json: @user_movies.as_json(
        only: [:id, :rating, :review, :watch_count, :created_at],
        include: { user: { only: [:id, :name] }, movie: { only: [:title, :fav_count, :length, :description, :rating, :id, :poster_url, :pub_date] } }
      ) }
      format.json { render json: @user_movies.as_json(
        only: [:id, :rating, :review, :watch_count, :created_at],
        include: { user: { only: [:id, :name] }, movie: { only: [:title, :fav_count, :length, :description, :rating, :id, :poster_url, :pub_date] } }
      ) }
    end
  end

end
