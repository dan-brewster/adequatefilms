class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.belongs_to :user_movie
      
      t.timestamps
    end
  end
end
