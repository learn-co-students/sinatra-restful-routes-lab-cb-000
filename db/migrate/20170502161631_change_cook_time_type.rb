class ChangeCookTimeType < ActiveRecord::Migration
  def change
    reversible do |direction|
      direction.up { change_column :recipes, :cook_time, :string }
      direction.down { change_column :recipes, :cook_time, :float }
    end
  end
end
