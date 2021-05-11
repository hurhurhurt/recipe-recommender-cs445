class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :recipe_name
			t.string :ingredients
			t.string :calories
			t.string :cuisine_type
			t.string :cooking_time

      t.timestamps null: false
    end
  end
end
