require 'rails_helper'

feature 'reviewing' do
  let!(:kfc) {Restaurant.create name: 'KFC' }

  scenario 'allows usrs to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "Blurgh"
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq "/restaurants/#{kfc.id}"
    expect(page).to have_content('Blurgh')

  end
end
