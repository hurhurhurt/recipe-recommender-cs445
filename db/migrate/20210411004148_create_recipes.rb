class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :index

      t.timestamps null: false
    end
  end
end
