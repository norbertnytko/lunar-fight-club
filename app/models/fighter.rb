class Fighter < ActiveRecord::Base
  has_many :skills, dependent: :destroy
  validates_presence_of :first_name, :description
  accepts_nested_attributes_for :skills
end
