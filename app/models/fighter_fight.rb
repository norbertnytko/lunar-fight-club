class FighterFight < ActiveRecord::Base
  belongs_to :fight
  belongs_to :fighter
end
