require './matched_pairs'
require 'rspec'

RSpec.describe "MatchedPairs" do 
  let(:list_of_items) { 
    [
      "Candy Bar, 500", 
      "Paperback Book, 700", 
      "Detergent, 1000", 
      "Headphones, 1400", 
      "Earmuffs, 2000", 
      "Bluetooth Stereo, 6000"
    ]
  }

  subject(:products_instance) { 
    Products.new(list_of_items).parse_products
  }

  it "should accept a list of products" do 
    get_pairs = MatchedPairs.new(products_instance)
    expect(get_pairs.products.size).to eq(15)
  end

  it "should return best match" do 
    get_pairs = MatchedPairs.new(products_instance, 1500)
    expect(get_pairs.best_result).to eq("Candy Bar 500, Detergent 1000")
  end

  it "should return Not Possible when unable to match" do 
    get_pairs = MatchedPairs.new(products_instance, 300)
    expect(get_pairs.best_result).to eq("Not Possible")
  end

end