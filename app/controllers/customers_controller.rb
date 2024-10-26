require_relative "../views/customer_view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customer_view = CustomerView.new
  end

  def list
    # ask the repository to give us all the customers
    customers = @customer_repository.all # an array of customer instances
    # ask the view to display the customers
    @customer_view.display(customers)
  end

  def add
    # ask the view to ask the user for the name of a customer and store it
    name = @customer_view.ask_for("name")
    # ask the view to ask the user for the price of a customer and store it
    address = @customer_view.ask_for("address")
    # create a new customer instance
    customer = Customer.new(name: name, address: address)
    # ask the repository to save the meal
    @customer_repository.create(customer)
  end
end
