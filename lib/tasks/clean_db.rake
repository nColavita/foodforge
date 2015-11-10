require 'net/http'

task :error_404 => :environment do
	recipes = Recipe.all
	recipes.each_with_index do |recipe, index|
		begin	
			if (Net::HTTP.get_response(URI.parse(recipe['image'])).code == '404')
				recipe.destroy
			end
		rescue
			nil
		end
		if index % 1000 == 0
			puts index 
		end
	end
end

task :epi_default => :environment do
	recipes = Recipe.all

	recipes.each_with_index do |recipe, index|
		begin	
			if (Net::HTTP.get_response(URI.parse(recipe['image'])) == 'http://www.epicurious.com/rd_images/global_images/epicurious-facebook.png')
					recipe.destroy
			end
		rescue
			nil
		end
		if index % 1000 == 0
			puts index 
		end
	end
end

task :all_reci_default => :environment do
	recipes = Recipe.all

	recipes.each_with_index do |recipe, index|
		begin	
			if (Net::HTTP.get_response(URI.parse(recipe['image'])) == 'http://images.media-allrecipes.com/images/44555.gif')
					recipe.destroy
			end
		rescue
			nil
		end
		if index % 1000 == 0
			puts index 
		end
	end
end

task :nil => :environment do
	recipes = Recipe.all

	recipes.each_with_index do |recipe, index|
		if recipe['image'] == nil
				recipe.destroy
		end
		if index % 1000 == 0
			puts index 
		end
	end
end





