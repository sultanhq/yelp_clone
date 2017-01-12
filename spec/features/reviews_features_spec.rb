require 'rails_helper'

feature 'reviewing' do
  scenario 'allows users to leave a review using a form' do
    sign_up
    add_a_restaurant
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'Blurgh'
    select '3', from: 'Rating'
    click_button 'Leave Review'
    click_link 'KFC'
    expect(page).to have_content('Blurgh')
  end

  scenario 'displays an average rating for all reviews' do
    sign_up
    add_a_restaurant
    leave_review('meh', '1')
    click_link('Sign out')
    sign_up_2
    leave_review('great', '5')
    expect(page).to have_content('Average Rating : 3')
  end
end
