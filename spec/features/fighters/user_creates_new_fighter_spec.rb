require 'rails_helper'

describe 'user creates new fighter', js: true do
  subject { visit new_fighter_path }

  scenario 'with valid input' do
    subject
    fill_in 'fighter_first_name', with: 'Berry'
    fill_in 'Last name', with: 'Allen'
    fill_in 'Description', with: 'The fastest man alive.'

    click_link 'add skill'

    fill_in 'Name', with: 'Running'
    fill_in 'Level', with: '5'

    click_button 'Create Fighter'
    expect(page).to have_content 'Berry Allen'
  end

  scenario 'with invalid input' do
    subject

    click_button 'Create Fighter'
    expect(page).to have_content "can't be blank"
  end
end
