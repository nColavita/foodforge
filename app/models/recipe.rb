class Recipe < ActiveRecord::Base
	has_many :users, through: :favorites
	has_many :favorites

	# Custom SQL query that goes through the Tables, finds all occurrences of a given ID in the DB
	# Then stores the number of times each one occurs
	# Then orders the new variables favorites_count in descending order with a limit of 4 (top 4 occurrences)
	
	# recipes.* selects all the recipes from the Recipe table
	# COUNT  returns the number of rows that matches favorites.id and sets it to a varialbe favorites_count
	# .joins combines the output from 2 row sources and returns 1 row 
	# .group groups together 
	# .order orders the variables favorites_count in descending order
	# .limit sets a limit on how many in the collection can be viewed
	
	def self.top4
	  select('recipes.*, COUNT(favorites.id) AS favorites_count').
	    joins(:users).                                                   
	    group('recipes.id').
	    order('favorites_count DESC').
	    limit(4)
	end

	# Custom SQL query to the DB
	# .inject is closely related to .map, except .inject returns a single line result of the loop 
	# where as .map gives you back an array of changes to a given argument
	# It is taking the result(which is the current Recipe WHERE and combining it with .inject with another ingredients LIKE)

	#  SELECT  "recipes".* FROM "recipes" WHERE (ingredients LIKE '%chicken%') AND (ingredients LIKE '%lemon%')  ORDER BY "recipes"."id"

	def self.find_matches(query)
		query.inject(self) do | result, q |
			result.where("ingredients LIKE ?", "%#{q}%")
		end
	end

	# Custom method to take an argument of ingredients from a Recipe, split of the \n character as an array

	def shopping_list(ingredients)
		list = ingredients.split(/\n/)
	end

end

#Grab the instance variable from the form submission, break it up into an array
#Go through each Recipe[:ingredients] and loops through checking if each word in the array is there
#SQL LIKE Operator is used in a WHERE clause to search for a specified pattern in a column.

# scope :find_matches , ->(query) {  where('ingredients LIKE :query', query: "%#{query.downcase}%") }