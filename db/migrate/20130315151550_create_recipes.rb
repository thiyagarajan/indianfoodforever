class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :category_id
      t.string :name
      t.string :ingredients
      t.string :description

      t.timestamps
    end
  end
end
