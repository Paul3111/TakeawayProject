class Dish
  def add(dish_name, dish_price)
    return @dish = {dish_name => dish_price}
  end

  def name
    @dish.keys.join()
  end
  
  def price
    @dish.values.join().to_f
  end
end