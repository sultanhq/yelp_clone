require 'rails_helper'

feature 'reviewing' do

  scenario 'allows users to leave a review using a form' do
    sign_up
    add_a_restaurant
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "Blurgh"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    click_link 'KFC'
    expect(page).to have_content('Blurgh')
  end
end
