class Menu
  def initialize
    @menu_list = []
  end
  
  def add(dish)
    if dish.values[0].instance_of?(String)
      fail "Price must be a float, not a string!"
    elsif dish.values[0] == nil
      fail "Please insert price!"
    else
      @menu_list << dish
    end
  end
  
  def remove_dish(dish_name)
    @menu_list.delete(@menu_list.find {|dish| dish.include?(dish_name)})
  end
  
  def view_dish(dish_name)
    @menu_list.each do |dish|
      if dish.keys == [dish_name]
        return "#{dish.keys.join()}: £#{dish.values.join()}"
      end
    end
  end
  
  def view_all_dishes
    @menu_list
  end
end