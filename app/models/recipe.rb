class Recipe
  attr_accessor :name, :ingredients, :cook_time

  def initialize(name, ingredients, cook_time)
    @name = name
    @ingredients = ingredients
    @cook_time = cook_time
  end
end
