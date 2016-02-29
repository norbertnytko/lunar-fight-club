class Fighter < ActiveRecord::Base
  has_many :skills, dependent: :destroy

  has_many :fighter_fights
  has_many :fights, through: :fighter_fights

  has_many :wins, class_name: 'Fight', foreign_key: :winner_id
  has_many :losses, class_name: 'Fight', foreign_key: :loser_id

  validates_presence_of :first_name, :description
  accepts_nested_attributes_for :skills
end
