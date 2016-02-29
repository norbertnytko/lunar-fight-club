class Fighter < ActiveRecord::Base
  has_many :skills, dependent: :destroy
  has_many :fighter_fight
  has_many :fights, through: :fighter_fight

  validates_presence_of :first_name, :description
  accepts_nested_attributes_for :skills
end
