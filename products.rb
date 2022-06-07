# if either of these Structs grow then it is a candidate to turn into a class
Product = Struct.new(:name, :cost)

PairedProducts = Struct.new(:product_array, :total) do
  def to_s
    product_array.map { |product| "#{product.name} #{product.cost}"}.join(", ")
  end
end

class Products
  attr_reader :products, :items

  def initialize(list_of_items)
    @items    = list_of_items
    @products = []
  end

  def parse_products(combination_size = 2)
    temp_items = []
    items.each do |item|
      name, cost = item.split(',')
      temp_items << Product.new(name, cost.strip.to_i)
    end
    produce_product_pairs(temp_items, combination_size)
  end

  private

  def produce_product_pairs(temp_items, combination_size = 2)
    temp_items.combination(combination_size).to_a.each do |pair|
      add_to_products(pair, pair.map(&:cost).inject(0, :+))
    end
    products
  end

  def add_to_products(product_array, total)
    products << PairedProducts.new(product_array, total)
  end
end
