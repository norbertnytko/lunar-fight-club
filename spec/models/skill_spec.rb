require 'rails_helper'

RSpec.describe Skill, type: :model do
  subject(:skill) { build_stubbed :skill}

  describe 'validations' do
    it 'has valid factory' do
      expect(skill).to be_valid
    end

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :level }
    it { is_expected.to validate_inclusion_of(:level).in_range (0..5) }
  end

  describe 'database columns' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :level }
    it { is_expected.to have_db_column :fighter_id }
  end

  describe 'associations' do
    it { is_expected.to belong_to :fighter }
  end


end
