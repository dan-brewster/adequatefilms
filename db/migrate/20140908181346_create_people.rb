class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.datetime :birthdate
      t.datetime :deathdate
      t.string :bio
      
      t.timestamps
    end
  end
end
