class CreateUserMovieIndicies < ActiveRecord::Migration
  def change
    add_index :updates, [:created_at], :name => "updates_created_at"
  end
end
