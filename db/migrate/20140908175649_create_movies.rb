class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.datetime :pub_date
      t.string :rating
      t.text :description

      t.timestamps
    end
  end
end
