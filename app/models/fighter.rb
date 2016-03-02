class Fighter < ActiveRecord::Base
  has_many :skills, dependent: :destroy

  has_many :fighter_fights
  has_many :fights, through: :fighter_fights

  has_many :wins, class_name: 'Fight', foreign_key: :winner_id
  has_many :losses, class_name: 'Fight', foreign_key: :loser_id

  has_attached_file :avatar, styles: { medium: '300x300>',
    thumb: '100x100>' }, default_url: '/system/missing_avatar.jpg'

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_presence_of :first_name, :description

  accepts_nested_attributes_for :skills

  def number_of_wins
    fights.where(winner_id: id).count
  end

  def number_of_fights
    fights.where('winner_id = ? OR losser_id = ?', id, id).count
  end

  def power_level
    skills_levels_sum = skills.pluck(:level).inject(0) do |sum, x|
      sum + x
    end

    skills_levels_sum + experience_points
  end

  def gain_winner_experience!
    self.experience_points += 3
  end

  def gain_losser_experience!
    self.experience_points += 1
  end
end
