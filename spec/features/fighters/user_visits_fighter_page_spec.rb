require 'rails_helper'

describe 'user check fighter details'  do
  let!(:fighter) { create :fighter }

  before { visit fighter_path(fighter) }

  it 'shows fighters name' do
    expect(page).to have_content "#{fighter.first_name} #{fighter.last_name}"
  end

  it 'shows fighter description' do
    expect(page).to have_content fighter.description
  end

  it 'shows fighter score'

  it 'lists fighter skills'
end
