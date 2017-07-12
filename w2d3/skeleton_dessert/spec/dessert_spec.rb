require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :titleize => "Francis") }
  subject(:dessert) { Dessert.new('French', 5, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('French')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('French', '5', chef) }.to raise_error('ArgumentError')
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient('basil')
      expect(dessert.ingredients.length).to eq(1)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient('basil')
      dessert.add_ingredient('garlic')
      dessert.add_ingredient('butter')
      dessert.add_ingredient('ham')
      dessert.add_ingredient('salt')
      ordered_ingredients = %w(basil garlic butter gam salt)
      dessert.mix!
      expect(dessert.ingredients).to_not eq(ordered_ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(3)
      expect(dessert.quantity).to eq(2)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(6) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    # allow(chef).to receive(:titleize).and_return("Francis")
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to match(/Francis/)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
