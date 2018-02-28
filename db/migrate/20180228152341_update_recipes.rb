class UpdateRecipes < ActiveRecord::Migration[4.2]
  def change
    change_table :recipes do |t|
      t.change :cook_time, :text
    end
  end
end
