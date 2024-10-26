# require_relative "app/models/meal"
require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/customers_controller"
require_relative "router"

# p Meal.new(name: "pizza", price: "1500")

meal_csv_file = File.join(__dir__, "data/meals.csv")
meal_repo = MealRepository.new(meal_csv_file)
meals_controller = MealsController.new(meal_repo)

customer_csv_file = File.join(__dir__, "data/customers.csv")
customer_repo = CustomerRepository.new(customer_csv_file)
customers_controller = CustomersController.new(customer_repo)

router = Router.new(meals_controller, customers_controller)

router.run
