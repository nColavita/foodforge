class CreateFavoritesTable < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :recipe_id
    end
  end
end
