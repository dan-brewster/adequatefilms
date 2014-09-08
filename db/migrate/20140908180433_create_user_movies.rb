class CreateUserMovies < ActiveRecord::Migration
  def change
    create_table :user_movies do |t|
      t.belongs_to :movie
      t.belongs_to :user
      t.string :rating
      t.text :review
      t.integer :like_count
      t.float :weight
      t.string :title
      t.integer :watch_count
      t.datetime :watch_date 
      t.timestamps
    end
  end
end
