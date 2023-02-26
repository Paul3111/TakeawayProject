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

# 1 - Adds a todo.
  first_diary = Diary.new
  task_1 = ToDo.new("Paul Lazar","Go shop!"
  task_1.add_to_diary # => # ["Paul Lazar","Go shop!"]
  
# Integration tests for Receipt

# 1 - 

4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class 
at a more granular level of detail.

# 1 - Adds a todo.
  todo_list1 = ToDo.new
  todo_list1.add_to_todo("Paul Lazar","Go shop!") # => # ["Paul Lazar","Go shop!"]


5. Implement the Behaviour
After each test you write, follow the test-driving process of 
red, green, refactor to implement the behaviour.