class Fight < ActiveRecord::Base
  has_many :fighter_fight
  has_many :fighters, through: :fighter_fight
end
