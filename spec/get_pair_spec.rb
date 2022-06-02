require './get_pair'
require 'rspec'

RSpec.describe "GetPair" do 
  it "should return best match" do 
    get_pair = GetPair.new(['prices.txt', 1500]).run
    expect(get_pair).to eq("Candy Bar 500, Detergent 1000")
  end
end