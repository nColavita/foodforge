class Recipe < ActiveRecord::Base

	def self.find_matches(query)
  	where('ingredients LIKE :query', query: "%#{query}%")
	end
	
end

#Grab the instance variable from the form submission, break it up into an array
#Go through each Recipe[:ingredients] and loops through checking if each word in the array is there
#SQL LIKE Operator is used in a WHERE clause to search for a specified pattern in a column.

# scope :find_matches , ->(query) {  where('ingredients LIKE :query', query: "%#{query.downcase}%") }