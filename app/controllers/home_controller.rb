class HomeController < ApplicationController

  respond_to :json, :html

  def index
  end

  def recent_updates
    @updates = Update.order("created_at desc").limit(5)
    respond_to do |format|
      format.html { render json: @updates.as_json(
        only: [:created_at],
        include: { user_movie: { only: [], include: { user: { only: [:id, :name] }, movie: { only: [:title, :description, :rating, :id, :poster_url] } } } }
      ) }
      format.json { render json: @updates.as_json(
        only: [:created_at],
        include: { user_movie: { only: [], include: { user: { only: [:id, :name] }, movie: { only: [:title, :description, :rating, :id, :poster_url] } } } }
      ) }
    end
  end
end
