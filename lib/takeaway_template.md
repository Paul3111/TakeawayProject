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
  
  Menu.add_dish(dish_name, dish_price) # adds a dish to the list
  Menu.view_dish(dish_name) # returns the dish name and price
  Menu.view_all_dishes # returns all dishes in a list
  
  Receipt.add_to_order(dish_name, dish_price) # adds a dish to the order
  Receipt.view_order # returns the whole order and the total value
  Receipt.remove_dish(dish_name) # removes a dish from the order

2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything.
The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

Also design the interface of each class in more detail.

class Diary
  def initialize
    # starts with an empty array for todos
    # starts with an empty array for contacts
  end
  
  add_todo
    # adds a todo entry to list as text
  end
end

class Todo
  def initialize
    todo_list = []
  end

  def add_todo(todo_owner, todo_text)
    # adds todo item to diary as hash
  end
  
end

class PhoneBook
  def initialize
    contact_list = []
  end
  
  def add_to_phonebook(contact_name, contact_number)
    # adds contact name and number to contact_list
  end
  
end

3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations
and combinations that reflect the ways in which the system will be used.

#context - When at least one entry.
  # before do
  # end
# 1 - Adds a todo.
  first_diary = Diary.new
  task_1 = ToDo.new("Paul Lazar","Go shop!"
  task_1.add_to_diary # => # ["Paul Lazar","Go shop!"]
  
# 2 - Adds a contact person and number.
  first_diary = Diary.new
  contact_1 = PhoneBook.new("Paul Lazar","07802465000")
  contact_1.add_to_phonebook # => ["Paul Lazar","07802465000"]

# 3 - Views all todo items.
  first_diary = Diary.new
  task_1 = ToDo.new("Paul Lazar","Go shop!")
  task_2 = ToDo.new("Mary Jane","Go to the gym!"
  first_diary.view_all_todos # => ["Paul Lazar","Go shop!", "Mary Jane","Go to the gym!]

# 4 - Views all contacts (name and number).
  first_diary = Diary.new
  contact_1 = PhoneBook.new("Paul Lazar","07802465000")
  contact_2 = PhoneBook.new("Alice Jones","07802465001")
  first_diary.view_all_contacts # => ["Paul Lazar","07802465000", "Alice Jones","07802465001"]

4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class 
at a more granular level of detail.

# 1 - Adds a todo.
  todo_list1 = ToDo.new
  todo_list1.add_to_todo("Paul Lazar","Go shop!") # => # ["Paul Lazar","Go shop!"]

# 2 - Selects and returns a specific todo.
  todo_list1 = ToDo.new
  todo_list_1.add_todo("Paul Lazar", "Go study")
  todo_list_1.add_todo("Janice Jones", "Go shop")
  todo_list1.view_todo("Paul Lazar") # => # ["Paul Lazar","Go shop!"]

5. Implement the Behaviour
After each test you write, follow the test-driving process of 
red, green, refactor to implement the behaviour.