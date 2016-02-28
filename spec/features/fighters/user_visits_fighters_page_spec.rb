require 'rails_helper'

describe 'user visits fighters page'  do
  let!(:fighter) { create :fighter }

  it 'shows fighters names' do
    visit fighters_path
    expect(page).to have_content "#{fighter.first_name} #{fighter.last_name}"
  end
end
