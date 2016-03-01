require 'rails_helper'

RSpec.describe Fight, type: :model do
  describe 'validations'

  describe 'database columns' do
    it { is_expected.to have_many :fighter_fights }
    it { is_expected.to have_many(:fighters).through :fighter_fights }
  end

  describe 'associations' do
  end

  describe '#settle_fight' do
    let(:batman) { create :fighter }

    let(:magneto) { Fighter.create(
      first_name: 'Magneto',
      description:'Flight through magnetic fields.',
      skills: [
        Skill.create(name: 'Thoughts shield', level: 3),
        Skill.create(name: 'Charisma', level: 4)
      ]
    )}
    subject { Fight.create(fighters:[batman, magneto] )}

    context 'first player has higher power level' do
      it 'set first player to fight winner' do
        expect(subject.winner).to eq batman
      end

      it 'set second player to losser winner' do
        expect(subject.losser).to eq magneto
      end
    end

    context 'second player has higher power level' do
      subject { Fight.create(fighters:[magneto, batman] )}

      it 'set second player to fight winner' do
        expect(subject.winner).to eq batman
      end

      it 'set first player to losser winner' do
        expect(subject.losser).to eq magneto
      end
    end

    context 'both players have the same power level'

    it 'add 3 experience points to winner' do
      expect(subject.winner.experience_points).to eq 3
    end

    it 'add 1 experience points to losser' do
      expect(subject.losser.experience_points).to eq 1
    end
  end
end
