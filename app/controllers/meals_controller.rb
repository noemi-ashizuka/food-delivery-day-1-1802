require_relative "../views/meal_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meal_view = MealView.new
  end

  def list
    # ask the repository to give us all the meals
    meals = @meal_repository.all # an array of meal instances
    # ask the view to display the meals
    @meal_view.display(meals)
  end

  def add
    # ask the view to ask the user for the name of a meal and store it
    name = @meal_view.ask_for("name")
    # ask the view to ask the user for the price of a meal and store it
    price = @meal_view.ask_for("price")
    # create a new meal instance
    meal = Meal.new(name: name, price: price)
    # ask the repository to save the meal
    @meal_repository.create(meal)
  end
end