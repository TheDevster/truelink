require './products'
require 'rspec'

RSpec.describe "Products" do 
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
    Products.new(list_of_items)
  }

  it "starts with an empty product list" do 
    expect(products_instance.products).to be_empty
  end

  it "accepts a list of items" do 
    expect(products_instance.items.size).to eq(6)
  end

  it "creates a list of product pairs" do 
    expect(products_instance.parse_products.size).to eq(15)
  end

  it "populates products array" do 
    parsed_products = products_instance.parse_products
    expect(products_instance.products.size).to eq(parsed_products.size)
  end

  it "converts list to paired products" do 
    expect(products_instance.parse_products[0].class).to eq(PairedProducts)
  end
end