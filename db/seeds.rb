# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'json'
require 'net/http'

http = Net::HTTP.new(@host, @port)
http.read_timeout = 5

file = File.read("../foodforge/db/recipeitems-latest.json")
recipes = JSON.parse(file)

# !!!! Fix NET:ReadTimeout Error when handling the get_response conditional for creating Recipes !!!!

recipes.each do |r|
	begin	
		# if r['image'] != nil && (Net::HTTP.get_response(URI.parse(r['image'])).code == '200')
			Recipe.create( name: r['name'], ingredients: r['ingredients'], url: r['url'], image: r['image'], cookTime: r['cookTime'], source: r['source'], recipeYield: r['recipeYield'], prepTime: r['prepTime'], description: r['description'])
		# end
	rescue 
		nil
	end
end

# Replace \n in the Ingredients string with a comma and space
# .gsub!(/\n/,', ')

# my_recipes = Recipe.all

# my_recipes.each do |recipe|
# 	Ingredient.create(recipe['ingredients'].gsub!(/\n/,', ').split(",").map)
# end

# my_recipes['ingredients'].gsub!(/\n/,', ').split(",").map do |ingredient|
# 	Ingredient.create(ingredient)
# end


