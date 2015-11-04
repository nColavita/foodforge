class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :ingredients
      t.string :url
      t.string :image
      t.string :recipeYield
      t.string :cookTime
      t.string :prepTime
      t.string :source
      t.text :description
    end
  end
end
