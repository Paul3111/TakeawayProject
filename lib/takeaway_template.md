ORDERFOOD Multi-Class Planned Design Recipe
1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and 
will be delivered before 18:52" after I have ordered.

Fair warning: if you push your Twilio API Key to a public Github repository,
anyone will be able to see and use it. What are the security implications of that?
How will you keep that information out of your repository?

The program will have three classes:

  Dish.new # initializes with no arguments
  Menu.new # initializes with empty list
  Receipt.new # initializes with 

  Dish.name # returns the dish name as string
  Dish.price # returns the dish price as float
  Dish.add(dish_name, dish_price) # adds a dish (string) and price (float) within a hash. 
  
  Menu.add_dish # adds a dish to the list
  Menu.view_dish(dish_name) # returns the dish name and price
  Menu.remove_dish(dish_name) # removes a dish from the list
  Menu.view_all_dishes # returns all dishes in a list
  
  Receipt.add_to_order(dish) # adds a dish to the order
  Receipt.view_order # returns the whole order and the total value
  Receipt.remove_dish(dish_name) # removes a dish from the order

2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything.
The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

Also design the interface of each class in more detail.

class Dish

  def add(dish_name, dish_price)
    # dish_name is a string
    # dish_price is a float
    # adds a dish and returns it as a hash
  end
  
  def name
    # returns the dish name
  end
  
  def price
    # returns the dish price
  end
end

class Menu
  def initialize
    menu_list = []
  end
  
  def add(dish)
    # adds a dish to the list (a hash within a list)
  end
  
  def remove_dish(dish_name)
    # removes a dish from the list
  end
  
  def view_dish(dish_name)
    # matches and returns a dish and the price (converted into a string)
  end
  
  def view_all_dishes
    # returns the list of hashes with all dishes
  end
  
end

Class Receipt
  def initialize
    # initializes with an empty list
  end
  
  def add_to_order(dish)
    # adds a dish to the list
  end
  
  def view_order
    # returns the list of dishes and calculates the total cost
  end
end

  def remove_dish(dish_name)
    # removes a dish from the list and returns the updated list
  end

3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations
and combinations that reflect the ways in which the system will be used.

# Integration tests for Menu

# 1 - Adds a dish to the menu.
  menu1 = Menu.new
  dish1 = Dish.new("Scallop soup", 5.5)
  menu1.add(dish1) # => [{"Scallop soup" => 5.5}]
  
# 2 - Remove a dish from a menu and update list
  menu1 = Menu.new
  dish1 = Dish.new("Scallop soup" => 5.5)
  dish2 = Dish.new("Scampi soup" => 3.5)
  dish3 = Dish.new("Fries" => 1.5)
  menu1.add(dish1)
  menu1.add(dish2)
  menu1.add(dish3)
  menu1.remove_dish("Scampi soup")
  menu1.view_all_dishes # => [{"Scallop soup" => 5.5}, {"Fries" => 1.5}]
  
# 3 - Returns a selected dish
  menu1 = Menu.new
  dish1 = Dish.new("Scallop soup" => 5.5)
  menu1.add(dish1)
  menu1.view_dish # => [{"Scallop soup" => 5.5}]
  
# 4 - Returns all dishes in the list
  menu1 = Menu.new
  dish1 = Dish.new("Scallop soup" => 5.5)
  dish2 = Dish.new("Scampi soup" => 3.5)
  dish3 = Dish.new("Fries" => 1.5)
  menu1.add(dish1)
  menu1.add(dish2)
  menu1.add(dish3)
  menu1.view_all_dishes # => [{"Scallop soup" => 5.5}, {"Fries" => 1.5} {"Fries" => 1.5}]

# Integration tests for Receipt

# 1 - Adds dish to order and receipt
  order1 - Receipt.new
  dish1 = Dish.new("Scallop soup", 5.5)
  order1.add_to_order(dish1)
  order1.view_order # => [{"Scallop soup" => 5.5}, {"Total is £:" => 13.5}]

# 2 - Removes a dish and returns the updated order and receipt
  order1 - Receipt.new
  dish1 = Dish.new("Scallop soup", 5.5)
  dish2 = Dish.new("Scampi soup", 3.5)
  dish3 = Dish.new("Fries", 1.5)
  order1.add_to_order(dish1)
  order1.add_to_order(dish2)
  order1.add_to_order(dish3)
  order1.remove_dish(dish2)
  order1.view_order # => [{"Scallop soup" => 5.5}, {"Fries", 1.5} => {"Totals is £:"} => 7]

4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class 
at a more granular level of detail.

# 1 - Adds a dish.
  plate1 = Dish.new
  plate1.add("Scallop soup", 5.5)
  plate1.name # => "Scallop soup"
  plate1.price # => 5.5
  
# 2 - Adds a dish to the menu list and returns it
  menu1 = Menu.new
  plate1 = Dish.new
  plate1.add("Cauliflower soup", 2.5)
  menu1.add(plate1)
  menu1.view_dish("Cauliflower soup") # => "Cauliflower soup: £2.5"

# 3 - Removes a dish and returns the updated list
  menu1 = Menu.new
  plate1 = Dish.new
  plate2 = Dish.new
  plate3 = Dish.new
  plate1.add("Cauliflower soup", 2.5)
  plate2.add("Fries", 1.5)
  plate3.add("Ice cream", 1.5)
  menu1.add(plate1)
  menu1.add(plate2)
  menu1.add(plate3)
  menu1.remove_dish("Ice cream")
  menu1.view_all_dishes # => [{"Cauliflower soup" => 2.5}, {"Fries" => 1.5}]

# 4 - Adds dishes to receipt, removes one dish and returns the updated list
  receipt1 = Receipt.new
  plate1 = Dish.new
  plate2 = Dish.new
  plate3 = Dish.new
  plate1.add("Cauliflower soup", 2.5)
  plate2.add("Fries", 1.5)
  plate3.add("Ice cream", 1.5)
  receipt1.add(plate1)
  receipt1.add(plate2)
  receipt1.add(plate3)
  receipt1.remove_dish("Ice cream")
  receipt1.view_order # => [{"Cauliflower soup" => 2.5}, {"Fries" => 1.5}, {"Total is £:"} => 4]

5. Implement the Behaviour
After each test you write, follow the test-driving process of 
red, green, refactor to implement the behaviour.