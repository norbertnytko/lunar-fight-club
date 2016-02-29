require 'rails_helper'

RSpec.describe Fight, type: :model do
  describe 'validations'

  describe 'database columns' do
    it { is_expected.to have_many :fighter_fight }
    it { is_expected.to have_many(:fighters).through :fighter_fight }
  end

  describe 'associations' do
  end
end