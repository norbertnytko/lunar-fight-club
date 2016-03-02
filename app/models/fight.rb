class Fight < ActiveRecord::Base
  has_many :fighter_fights
  has_many :fighters, through: :fighter_fights

  belongs_to :winner, class_name: 'Fighter', foreign_key: :winner_id
  belongs_to :losser, class_name: 'Fighter', foreign_key: :losser_id

  after_create :settle_fight

  validate do
    if fighters[0] == fighters[1]
      errors.add(:base, 'Fighters must be different')
    end
  end

  private

  def settle_fight
    first_fighter = fighters[0]
    second_fighter = fighters[1]


    if first_fighter.power_level > second_fighter.power_level
      first_fighter.gain_winner_experience!
      second_fighter.gain_losser_experience!

      self.winner = first_fighter
      self.losser = second_fighter
      self.save
    else
      second_fighter.gain_winner_experience!
      first_fighter.gain_losser_experience!

      self.winner = second_fighter
      self.losser = first_fighter
      self.save
    end
  end
end
