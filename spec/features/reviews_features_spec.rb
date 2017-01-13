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
    expect(page).to have_content('Blurgh')
  end

  scenario 'a review is able to be deleted' do
    sign_up
    add_a_restaurant
    leave_review('meh', '1')
    click_link 'Delete your review'
    expect(page).not_to have_content('meh')
  end

  scenario 'a review is only allowed to be deleted by its owner' do
    sign_up
    add_a_restaurant
    leave_review('meh', '1')
    click_link('Sign out')
    sign_up_2
    click_link 'KFC'
    expect(page).not_to have_link('Delete your review')
  end

  scenario 'displays an average rating for all reviews' do
    sign_up
    add_a_restaurant
    leave_review('meh', '1')
    click_link('Sign out')
    sign_up_2
    leave_review('great', '5')
    visit '/'
    expect(page).to have_content('Average Rating : 3')
  end
end
