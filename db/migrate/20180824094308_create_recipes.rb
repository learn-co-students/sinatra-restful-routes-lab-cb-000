class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :receipes do |t|
      t.string :name 
      t.string :ingredients
      t.string :cook_time
    end
  end
end
