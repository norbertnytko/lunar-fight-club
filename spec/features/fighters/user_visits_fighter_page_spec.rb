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

  it 'shows fighter experience' do
    expect(page).to have_content fighter.experience_points
  end

  it 'shows fighter power level' do
    expect(page).to have_content fighter.power_level
  end

  it 'lists fighter skills' do
    expect(page).to have_content fighter.skills.pluck(:name, :level).join("")
  end
end
