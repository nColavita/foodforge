class RecipesController < ApplicationController
	# skip_before_action :verify_authenticity_token
	# before_action :successful_matches, only: [:search, :index]

	def search
		query = params[:ingredients]
		@matches = Recipe.find_matches(query)
		if @matches.length == 0
			redirect_to root_path, notice: "Unfortunately we couldn't find any recipes based off your search."
		end
		@recipes = @matches.first(20)
	end

	def favorite
		@recipe = Recipe.find(params[:id])
		Favorite.create(user_id: current_user.id, recipe_id: @recipe.id)
		redirect_to root_path, notice: "Favorited #{@recipe.name}."
	end

	def unfavorite
	end

end