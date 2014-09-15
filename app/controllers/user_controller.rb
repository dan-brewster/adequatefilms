class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html { render nothing: true }
      format.json { render json: @user }
    end
  end

  def movies
  end

end
