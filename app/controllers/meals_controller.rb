require_relative "../views/meal_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meal_view = MealView.new
  end

  def list
    display_meals
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

  def edit
	  display_meals
	  index = @meal_view.ask_for('number').to_i - 1
	  meal = @meal_repository.all[index]
	  meal.name = @meal_view.ask_for('new name')
	  meal.price = @meal_view.ask_for('new price').to_i
	  @meal_repository.update
	end

	def destroy
	  display_meals
	  index = @meal_view.ask_for('number').to_i - 1
	  @meal_repository.destroy(index)
	end

  private

  def display_meals
    # get the meals from the repository
    meals = @meal_repository.all
    # give the meals to the view to display them
    @meal_view.display(meals)
  end
end