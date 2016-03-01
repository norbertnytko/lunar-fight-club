class Fighter < ActiveRecord::Base
  has_many :skills, dependent: :destroy

  has_many :fighter_fights
  has_many :fights, through: :fighter_fights

  has_many :wins, class_name: 'Fight', foreign_key: :winner_id
  has_many :losses, class_name: 'Fight', foreign_key: :loser_id
  has_attached_file :avatar, styles: { medium: "300x300>",
    thumb: "100x100>" }, default_url: "/system/missing_avatar.jpg"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_presence_of :first_name, :description
  accepts_nested_attributes_for :skills
end
