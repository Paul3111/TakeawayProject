require 'dishes'

RSpec.describe Dish do
  before do
    @plate1 = Dish.new
  end
  
  it "Adds a dish." do
    expect(@plate1.add("Scallop soup", 5.5)).to eq "Scallop soup" => 5.5
  end
  
  it "Returns the dish name." do
    @plate1.add("Scallop soup", 5.5)
    expect(@plate1.name).to eq "Scallop soup"
  end
  
  it "Returns the dish price." do
    @plate1.add("Scallop soup", 5.5)
    expect(@plate1.price).to eq 5.5
  end
end