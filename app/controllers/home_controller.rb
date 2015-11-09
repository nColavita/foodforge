class HomeController < ApplicationController

	def show
		@recipes = Recipe.top4	
	end

end