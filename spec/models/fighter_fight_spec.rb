require 'rails_helper'

RSpec.describe FighterFight, type: :model do
  describe 'validations'

  describe 'database columns' do
    it { is_expected.to belong_to :fighter }
    it { is_expected.to belong_to :fight }
  end

  describe 'associations'
end
