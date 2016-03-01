require 'rails_helper'

RSpec.describe Fighter, type: :model do
  subject(:fighter) { build_stubbed :fighter}

  describe 'validations' do
    it 'has valid factory' do
      expect(fighter).to be_valid
    end

    it { is_expected.to validate_presence_of :first_name}
    it { is_expected.to validate_presence_of :description}

    it 'is invalid with less than 2 skills'

    it 'is invalid with more than 9 skills'
  end

  describe 'database columns' do
    it { is_expected.to have_db_column :first_name }
    it { is_expected.to have_db_column :last_name }
    it { is_expected.to have_db_column :description}
  end

  describe 'associations' do
    it { is_expected.to have_many(:skills).dependent(:destroy) }
    it { is_expected.to have_many :fighter_fights }
    it { is_expected.to have_many(:fights).through :fighter_fights }
    it { is_expected.to have_attached_file(:avatar) }
  end

  describe '#powerl_level' do
    subject(:fighter) { create :fighter}

    it "returns sum of fighter's skills levels and experience points" do
      expect(fighter.power_level).to eq 25
    end
  end

  describe '#gain_winner_experience' do
    subject(:fighter) { create :fighter}

    it 'increment fighter experience points by 3' do
      fighter.gain_winner_experience!
      expect(fighter.experience_points).to eq 3
    end
  end

  describe '#gain_losser_experience' do
    subject(:fighter) { create :fighter}

    it 'increment fighter experience points by 1' do
      fighter.gain_losser_experience!
      expect(fighter.experience_points).to eq 1
    end
  end
end
