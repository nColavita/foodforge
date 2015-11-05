class RecipesController < ApplicationController
	# skip_before_action :verify_authenticity_token
	# before_action :successful_matches, only: [:search, :index]

	def search
		@user = current_user
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
		respond_to do |format|
			flash.now[:notice] = "Favorited!"
			format.html { redirect_to search_path, notice: "Favorited #{@recipe.name}." }
			format.js {render nothing: true}
		end
	end

	def unfavorite
		@recipe = Recipe.find(params[:id])
		@fav = Favorite.find_by(user_id: current_user.id, recipe_id: @recipe.id)
		@fav.destroy
		redirect_to current_user
	end

end