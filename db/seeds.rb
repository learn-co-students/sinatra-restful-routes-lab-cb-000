Recipe.destroy_all

Recipe.create!([{
    name: "Spaghetti",
    ingredients: "Meatballs, Noodles, Tomato Sauce",
    cook_time: "30 minutes"
  },
  {
    name: "PB&J",
    ingredients: "Bread, Peaunut Butter, Jelly/Jam/Perserves",
    cook_time: "none"
  },
  {
    name: "Popcorn",
    ingredients: "Corn Kernels, Butter, Salt",
    cook_time: "3 minutes"
}])

puts "Created #{Recipe.count} recipes"
