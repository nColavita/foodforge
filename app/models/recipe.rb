class Recipe < ActiveRecord::Base
	has_many :users, through: :favorites
	
	# after_create :add_current_user_to_recipe_users

	def self.find_matches(query)
  	where('ingredients LIKE :query', query: "%#{query}%")
	end

	def self.find_multiple(*query)
	  rel = self
	  keywords.each do |k|
	    rel = rel.where("ingredients LIKE ?", "%#{k}%")
	  end
	  rel
	end

end

#Grab the instance variable from the form submission, break it up into an array
#Go through each Recipe[:ingredients] and loops through checking if each word in the array is there
#SQL LIKE Operator is used in a WHERE clause to search for a specified pattern in a column.

# scope :find_matches , ->(query) {  where('ingredients LIKE :query', query: "%#{query.downcase}%") }