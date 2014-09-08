class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.belongs_to :person
      t.string :character_name
      t.string :type
      t.string :bio
      t.timestamps
    end
  end
end
