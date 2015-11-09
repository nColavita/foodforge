class Recipe < ActiveRecord::Base
	has_many :users, through: :favorites
	has_many :favorites


	# after_create :add_current_user_to_recipe_users

	# def self.find_matches(query)
	# 	where('ingredients LIKE :query', query: "%#{query.downcase}%")
	# end
	def self.top4
	  select('recipes.*, COUNT(favorites.id) AS favorites_count').
	    joins(:users).                                                   
	    group('recipes.id').
	    order('favorites_count DESC').
	    limit(4)
	end

	def self.find_matches(query)
		query.inject(self) do | result, q |
			result.where("ingredients LIKE ?", "%#{q}%")
		end
	end

	def shopping_list(ingredients)
		list = ingredients.split(/\n/)
	end

end

#Grab the instance variable from the form submission, break it up into an array
#Go through each Recipe[:ingredients] and loops through checking if each word in the array is there
#SQL LIKE Operator is used in a WHERE clause to search for a specified pattern in a column.

# scope :find_matches , ->(query) {  where('ingredients LIKE :query', query: "%#{query.downcase}%") }