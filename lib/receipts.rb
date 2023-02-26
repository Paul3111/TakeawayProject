class Receipt
  def initialize
    @order_list = []
  end
  
  def add_to_order(dish)
    @order_list << dish
  end
  
  def view_order
    @total = @order_list.map {|dish| dish.values.sum}
    @order_list << {"Total is: £" => @total.sum}
    return @order_list
  end
  
  def remove_dish(dish_name)
    @order_list.delete(@order_list.find {|dish| dish.include?(dish_name)})
  end
end