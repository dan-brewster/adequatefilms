class MovieController < ApplicationController
  respond_to :json, :html

  def show
    @movie = Movie.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @updates.to_json }
    end
  end

  def index
  end

  def list
    @movies = Movie.where("id > ? and fav_count > 500", rand(58000) + 100).order('id asc').limit(10)
    respond_to do |format|
      format.html { render json: @movies.to_json }
      format.json { render json: @movies.to_json }
    end
  end
end
