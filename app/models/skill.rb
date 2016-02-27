class Skill < ActiveRecord::Base
  belongs_to :fighter
  validates_presence_of :name, :level
  validates_inclusion_of :level, in: 0..5
end
