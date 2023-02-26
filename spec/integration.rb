require 'menus'
require 'receipts'

RSpec.describe "Integration." do
  before do
    @menu1 = Menu.new
    @fake_dish1 = double :fake_dish1, add: {"Scallop soup" => 5.5}
  end
    
  it "Adds a dish to the Menu." do
    expect(@menu1.add(@fake_dish1.add)).to eq [{"Scallop soup" => 5.5}]
  end
  
  it "Removes a dish from the menu and returns the updated list." do
    @fake_dish2 = double :fake_dish2, add: {"Scampi soup" => 4.5}
    @fake_dish3 = double :fake_dish3, add: {"Fish and chips" => 3.5}
    @menu1.add(@fake_dish1.add)
    @menu1.add(@fake_dish2.add)
    @menu1.add(@fake_dish3.add)
    @menu1.remove_dish("Scallop soup")
    expect(@menu1.view_all_dishes).to eq [{"Scampi soup" => 4.5}, {"Fish and chips" => 3.5}]
  end
  
  it "Returns selected dish." do
    @fake_dish2 = double :fake_dish2, add: {"Scampi soup" => 4.5}
    @fake_dish3 = double :fake_dish3, add: {"Fish and chips" => 3.5}
    @menu1.add(@fake_dish1.add)
    @menu1.add(@fake_dish2.add)
    @menu1.add(@fake_dish3.add)
    expect(@menu1.view_dish("Scampi soup")).to eq "Scampi soup: £4.5"
  end
  
  it "Returns all dishes." do
    @fake_dish2 = double :fake_dish2, add: {"Scampi soup" => 4.5}
    @fake_dish3 = double :fake_dish3, add: {"Fish and chips" => 3.5}
    @menu1.add(@fake_dish1.add)
    @menu1.add(@fake_dish2.add)
    @menu1.add(@fake_dish3.add)
    expect(@menu1.view_all_dishes).to eq [{"Scallop soup" => 5.5}, {"Scampi soup" => 4.5}, {"Fish and chips" => 3.5}]
  end
  
  it "Adds dish to order and receipt." do
    @order1 = Receipt.new
    @fake_dish2 = double :fake_dish2, add: {"Scampi soup" => 4.5}
    @fake_dish3 = double :fake_dish3, add: {"Fish and chips" => 3.5}
    @order1.add_to_order(@fake_dish1.add)
    @order1.add_to_order(@fake_dish2.add)
    @order1.add_to_order(@fake_dish3.add)
    expect(@order1.view_order).to eq [{"Scallop soup" => 5.5},{"Scampi soup" => 4.5},{"Fish and chips" => 3.5},{"Total is: £" => 13.5}]
  end
  
  it "Removes a dish and returns the updated order and receipt." do
    @order1 = Receipt.new
    @fake_dish2 = double :fake_dish2, add: {"Scampi soup" => 4.5}
    @fake_dish3 = double :fake_dish3, add: {"Fish and chips" => 3.5}
    @order1.add_to_order(@fake_dish1.add)
    @order1.add_to_order(@fake_dish2.add)
    @order1.add_to_order(@fake_dish3.add)
    @order1.remove_dish("Scampi soup")
    expect(@order1.view_order).to eq [{"Scallop soup" => 5.5}, {"Fish and chips" => 3.5}, {"Total is: £" => 9.0}]
  end
  
  context "When price input is invalid." do
    it "Fails when price is a string." do
      menu2 = Menu.new
      fake_dish1 = double :fake_dish1, add: {"Scallop soup" => "5.5"}
      expect {menu2.add(fake_dish1.add)}.to raise_error "Price must be a float, not a string!"
    end
    
    it "Fails when price is nil" do
      menu2 = Menu.new
      fake_dish1 = double :fake_dish1, add: {"Scallop soup" => nil}
      expect {menu2.add(fake_dish1.add)}.to raise_error "Please insert price!"
    end
  end
end
