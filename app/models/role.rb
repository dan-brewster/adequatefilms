class Role < ActiveRecord::Base
  has_one :person
  attr_accessible :character_name, :type, :bio
end
