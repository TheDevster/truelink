require './get_pair'
require 'rspec'

RSpec.describe "GetPair" do 
  it "should return best match" do 
    get_pair = GetPair.new(['prices.txt', 1500]).run
    expect(get_pair).to eq("Candy Bar 500, Detergent 1000")
  end

  it "should allow num_of_products argument to be passed" do 
    get_pair = GetPair.new(['prices.txt', 2500, 3]).run
    expect(get_pair).to eq("Candy Bar 500, Paperback Book 700, Detergent 1000")
  end
end