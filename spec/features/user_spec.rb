require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(first_name: "Vlad",last_name:"Lad", email: "vlad@gmail.com",password: "Hello123",user_setting: true )
  end

  it 'to user page' do
    visit "/users/#{@user.id}"
    expect(page.status_code).to eq(200)
  end

  it 'shows the users name on show page in a h1 tag' do
    visit login_path
    fill_in 'session[email]', with: "vlad@gmail.com"
    fill_in 'session[password]', with: "Hello123"
    click_button "Log in"
    expect(page).to have_css("h1", text: "Vlad Lad")
  end
end
