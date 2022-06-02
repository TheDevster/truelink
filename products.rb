# if either of these Structs grow then it is a candidate to turn into a class
Product = Struct.new(:name, :cost)

PairedProducts = Struct.new(:product_1, :product_2, :total) do
  def to_s
    "#{product_1.name} #{product_1.cost}, #{product_2.name} #{product_2.cost}"
  end
end

class Products
  attr_reader :products, :items

  def initialize(list_of_items)
    @items    = list_of_items
    @products = []
  end

  def parse_products
    temp_items = []
    items.each do |item|
      name, cost = item.split(',')
      temp_items << Product.new(name, cost.strip.to_i)
    end
    produce_product_pairs(temp_items)
  end

  private

  def produce_product_pairs(temp_items)
    temp_items.combination(2).to_a.each do |pair|
      add_to_products(pair[0], pair[1], pair.map(&:cost).inject(0, :+))
    end
    products
  end

  def add_to_products(product_1, product_2, total)
    products << PairedProducts.new(product_1, product_2, total)
  end
end
