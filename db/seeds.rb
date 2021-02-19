# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Ingredient.create(name: 'Mint')
# Ingredient.create(name: 'Vodka')
# Ingredient.create(name: 'Rhum')
# Ingredient.create(name: 'Tequila')
# Ingredient.create(name: 'Orange Juice')
# Ingredient.create(name: 'Tomato Juice')
# Ingredient.create(name: 'Paprika')
# Ingredient.create(name: 'Natto')
# Ingredient.create(name: 'Onion')
Cocktail.destroy_all
Cocktail.create!(name: 'Inception')
Cocktail.create!(name: 'FastAndFurious')
Cocktail.create!(name: 'MargaWhat?')
Cocktail.create!(name: 'Sayonara')
Cocktail.create!(name: 'WelcomeToEarth')
Cocktail.create!(name: 'BatmanReturns')

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)
Ingredient.destroy_all
# puts "#{user['name']} - #{user['bio']}"
user['drinks'].each do |ingredient|
  p ingredient
  Ingredient.create!(name: "#{ingredient['strIngredient1']}")
end
