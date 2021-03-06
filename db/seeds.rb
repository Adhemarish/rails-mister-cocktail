# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

Ingredient.destroy_all
Cocktail.destroy_all

puts "Creating ingredients & cocktails from API"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredient_serialized = open(url).read
ingredient_list = JSON.parse(ingredient_serialized)

ingredient_list["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end

mojito = Cocktail.create(name: "Mojito")
Dose.create(cocktail: mojito, ingredient: Ingredient.first, description: "2cl")

# Cocktail.create(name: "Pornstar")
# Cocktail.create(name: "Blueberry Passion")

puts "Finished"
