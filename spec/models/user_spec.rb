require 'rails_helper'
RSpec.describe User, type: :model do
  it "is valid" do
    user = User.new(first_name: "Vlad",last_name:"Flatiron", email: "vlad@gmail.com",password: "Hello123")
    expect(user).to be_valid
  end

  it "is invalid with no email" do
    user = User.new(first_name: "Vlad",last_name:"Flatiron", password: "Hello123")
    expect(user).to be_invalid
  end

  it "is invalid with a short name" do
    user= User.new(first_name: "V",last_name:"Flatiron",email: "vlad@gmail.com",password: "Hello123")
    expect(user).to be_invalid
  end

  it "is invalid when non-unique" do
    User.create(first_name: "Vlad", email: "vlad@gmail.com",password: "Hello")
    user = User.create(first_name: "Anuj", email: "vlad@gmail.com",password: "Hello123")
    expect(user).to be_invalid
  end
end
