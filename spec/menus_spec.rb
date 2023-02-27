require 'menus'
require 'dishes'

RSpec.describe Menu do
  before do
    @menu1 = Menu.new
    @dish1 = Dish.new
    @dish2 = Dish.new
    @dish3 = Dish.new
  end

  it "Adds a dish to the menu list and returns it." do
    @menu1.add(@dish1.add("Cauliflower soup", 2.5))
    expect(@menu1.view_dish("Cauliflower soup")).to eq "Cauliflower soup: £2.5"
  end
  
  it "Adds multiple dishes to the menu list and returns the list." do
    @menu1.add(@dish1.add("Cauliflower soup", 2.5))
    @menu1.add(@dish2.add("Fish and chips", 4.5))
    @menu1.add(@dish3.add("British breakfast", 4.5))
    expect(@menu1.view_all_dishes).to eq [{"Cauliflower soup" => 2.5}, {"Fish and chips" => 4.5}, {"British breakfast"=> 4.5}]
  end
  
  it "Removes a dish and returns the updated list." do
    @menu1.add(@dish1.add("Cauliflower soup", 2.5))
    @menu1.add(@dish2.add("Fish and chips", 4.5))
    @menu1.add(@dish3.add("British breakfast", 4.5))
    @menu1.remove_dish("Fish and chips")
    expect(@menu1.view_all_dishes).to eq [{"Cauliflower soup" => 2.5}, {"British breakfast"=> 4.5}]
  end
end