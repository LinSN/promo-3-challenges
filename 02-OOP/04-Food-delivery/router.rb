require_relative 'controller'


class Router
  def initialize
    @controller = Controller.new
    @running = true
  end

  def run
    puts "Welcome to the Beff'n'git!"
    puts "           --           "

    puts "Please enter you id"
    id = gets.chomp
    puts "Please enter you password"
    password = gets.chomp

    current_user = @controller.restaurant.employees[id]
    if password == current_user.password
      p "-------------------------------"
      p "Salut #{current_user.name} !!"
      if current_user.class == Manager
        p "Tu es un gagnant Gagnant, n'oublie pas que tu es le manager de l'annee !"
        p "-------------------------------"
        while @running
          display_tasks_manager
          action = gets.chomp.to_i
          print `clear`
          case action
          when 1 then @controller.list_customers
          when 2 then @controller.add_customers
          when 3 then @controller.view_orders
          when 4 then @controller.add_order
          when 5 then @controller.remove_order
          when 6 then @controller.list_employees
          when 7 then stop
          when 8 then run
          else puts "Please press 1, 2, 3, 4, 5, 6, 7 or 8"
          end
        end

      elsif current_user.class == DeliveryGuy

        while @running
          display_tasks_delivery_guy
          action = gets.chomp.to_i
          print `clear`
          case action
          when 1 then @controller.view_orders_delivery_guy(current_user)
          when 2 then @controller.complete_order_by_delivery_guy
          when 3 then stop
          when 4 then run
          else puts "Please press 1, 2, 3 or 4"
          end
        end


      end
    else
      puts "You're not allowed"
    end

  end

  def stop
    @running = false
  end

  private

  def display_tasks_manager
    puts ""
    puts "What do you want to do next?"
    puts "1 - List Customers"
    puts "2 - Add Customers"
    puts "3 - View order <customer_id>"
    puts "4 - Add order <customer_id>, <employee_id>"
    puts "5 - Remove order <order_id>"
    puts "6 - List Employees"
    puts "7 - Log out"
    puts "8 - Change User"
  end

  def display_tasks_delivery_guy
    puts ""
    puts "What do you want to do next?"
    puts "1 - View Orders"
    puts "2 - Complete order <order_id>"
    puts "3 - Log out"
    puts "4 - Change User"
  end
end

go = Router.new
go.run