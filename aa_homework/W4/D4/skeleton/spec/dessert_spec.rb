require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:dessert) { Dessert.new("cookie", 30, chef) }
  let(:chef) { double("chef", name:"paul") }

  describe "#initialize" do
    it "sets a type" do 
      expect(dessert.type).to eq("cookie")
    end


    it "sets a quantity" do
      expect(dessert.quantity).to eq(30)
    end


    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end
    

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("brownies", "deez", :chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to_not include("sugar")
      dessert.add_ingredient("sugar")
      expect(dessert.ingredients).to include("sugar")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(dessert.ingredients).to be_empty
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("chocolate")
      expect(dessert.ingredients).to eq(["sugar", "chocolate"])
      dessert.mix!
      expect(dessert.ingredients).to eq(["sugar", "chocolate"].shuffle)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(dessert.quantity).to eq(30)
      dessert.eat(23)
      expect(dessert.quantity).to eq(7)
    end

    it "raises an error if the amount is greater than the quantity" do 
      expect{dessert.eat(33)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Paul the Great Baker")
      expect(dessert.serve).to eq("Chef Paul the Great Baker has made 30 cookies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end

  end
end
