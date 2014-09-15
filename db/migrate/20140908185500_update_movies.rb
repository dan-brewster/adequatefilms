class UpdateMovies < ActiveRecord::Migration
  def change
      add_column :movies, :length, :integer
      add_column :movies, :fav_count, :integer
  end
end
