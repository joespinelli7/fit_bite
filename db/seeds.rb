# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Food.destroy_all
User.destroy_all
UserFood.destroy_all
Activity.destroy_all

protein_bar = Food.create(name: "Protein bar", calories: 300)
cheese_steak = Food.create(name: "Cheese Steak", calories: 800)
ice_cream = Food.create(name: "Ice Cream", calories: 500)
chicken = Food.create(name: "Chicken", calories: 600)
apple = Food.create(name: "Apple", calories: 100)

ash = User.create(first_name: "Ashley",last_name: "Zaki", age: 26, height: 63.0, weight: 125, gender: "F", email: "ash057@gmail.com", password: "ash1234567", goal: "maintain")
mandy = User.create(first_name: "Mandy",last_name: "Pilaud", age: 25, height: 75.0, weight: 118, gender: "F", email: "mandy234@gmail.com", password: "mandy154321",goal: "weight lose")
joe = User.create(first_name: "Joe",last_name: "Spinelli", age: 22, height: 74.0, weight: 180, gender: "M", email: "masterjoe@gmail.com", password: "123123123",goal: "weight gain")

lifting = Activity.create(name: "lifting", calories_burned: 500)
running = Activity.create(name: "running", calories_burned: 400)
basketball = Activity.create(name: "basketball", calories_burned: 350)

UserFood.create(user_id: 1, food_id: 3, servings: 2)
UserFood.create(user_id: 1, food_id: 4, servings: 1)
UserFood.create(user_id: 2, food_id: 5, servings: 2)
UserFood.create(user_id: 2, food_id: 2, servings: 3)
UserFood.create(user_id: 3, food_id: 2, servings: 1)
