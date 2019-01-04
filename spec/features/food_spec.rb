require 'rails_helper'

describe 'navigate' do
  before do
    @food = Food.create(name: "Cookie",calories:450)
  end

    it 'to food page' do
      visit "/foods/#{@food.id}"
      expect(page.status_code).to eq(200)
    end

    it 'shows the food name in a h1 tag and calories on show page' do
      visit food_path(@food)
      expect(page).to have_css("h1", text: "Cookie")
      expect(page).to have_css("div", text: "450 Calories")
    end

end
