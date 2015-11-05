class User < ActiveRecord::Base
	has_many :favorites, dependent: :destroy
	has_many :recipes, through: :favorites, dependent: :destroy

	#Instance method for every user. current_user.favorites 
	# def favorites
	# 	# Favorite.find_by(user_id: id)
	# 	Favorite.where(current_user.id)
	# end
end