class Fight < ActiveRecord::Base
  has_many :fighter_fights
  has_many :fighters, through: :fighter_fights

  belongs_to :winner, class_name: 'Fighter', foreign_key: :winner_id
  belongs_to :losser, class_name: 'Fighter', foreign_key: :losser_id

  after_create :settle_fight

  private

  def settle_fight
  end
end
