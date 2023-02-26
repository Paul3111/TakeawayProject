require 'receipts'
require 'dishes'

RSpec.describe Receipt do
  before do
    @receipt1 = Receipt.new
    @dish1 = Dish.new
  end
  
  it "Adds three dishes and returns the order with its total value." do
    @receipt1.add_to_order(@dish1.add("Caesar salad", 1.5))
    @receipt1.add_to_order(@dish1.add("Scallop soup", 5.5))
    @receipt1.add_to_order(@dish1.add("Bangers and mash", 3.5))
    expect(@receipt1.view_order).to eq [{"Caesar salad" => 1.5}, {"Scallop soup" => 5.5}, {"Bangers and mash" => 3.5},{"Total is: £" => 10.5}]
  end
  
  it "Removes a dish and returns the updated order." do
    @receipt1.add_to_order(@dish1.add("Caesar salad", 1.5))
    @receipt1.add_to_order(@dish1.add("Scallop soup", 5.5))
    @receipt1.add_to_order(@dish1.add("Bangers and mash", 3.5))
    @receipt1.remove_dish("Scallop soup")
    expect(@receipt1.view_order).to eq [{"Caesar salad" => 1.5}, {"Bangers and mash" => 3.5},{"Total is: £" => 5}]
  end
end