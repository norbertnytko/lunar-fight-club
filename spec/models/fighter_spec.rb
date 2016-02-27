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
    it 'has one avatar'
  end

end
