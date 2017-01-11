require 'rails_helper'

describe Restaurant, type: :model do
  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid unless it has a unique name' do
    user = User.create(email: "john@john.com", password: "password")
    user.restaurants.create(name: "Moe's Tavern")
  	restaurant = user.restaurants.new(name: "Moe's Tavern")
  	expect(restaurant).to have(1).error_on(:name)
  end
end
