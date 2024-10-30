class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      print_menu
      choice = gets.chomp.to_i
      print `clear`
      route_action(choice)
    end
  end

  private

  def print_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. List all meals"
    puts "2. Add a new meal"
    puts "3. Edit a meal"
    puts "4. Delete a meal"
    puts "5. Add new customer"
    puts "6. List all customers"
    puts "7. Edit a customer"
    puts "8. Delete customer"
    puts "9. Exit"
    print "> "
  end

  def route_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.edit
    when 4 then @meals_controller.destroy
    when 5 then @customers_controller.add
    when 6 then @customers_controller.list
    when 7 then @customers_controller.edit
    when 8 then @customers_controller.destroy
      
    when 9 then stop!
    else puts "Try again..."
    end
  end

  def stop!
    @running = false
  end
end
