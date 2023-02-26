class Dish
  def add(dish_name, dish_price)
    if dish_price.instance_of?(String)
      fail "Price must be a float, not a string!"
    elsif dish_price == nil
      fail "Please insert price!"
    else
      return @dish = {dish_name => dish_price}
    end
  end

  def name
    @dish.keys.join()
  end
  
  def price
    @dish.values.join().to_f
  end
end