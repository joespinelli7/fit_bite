require 'rails_helper'

describe 'navigate' do
  before do
    @activity = Activity.create(name: "Football",calories_burned:8)
  end

    it 'to activity page' do
      visit "/activities/#{@activity.id}"
      expect(page.status_code).to eq(200)
    end

    it 'shows the activity name in a h1 tag and calories burned on show page' do
      visit activity_path(@activity)
      expect(page).to have_css("h1", text: "Football")
      expect(page).to have_css("div", text: "Burns 8 Calories/min")
    end

end
