# Take a list of products and total then return a matching pair that is equal_to or less_than the total
class MatchedPairs
  attr_reader :products, :total

  def initialize(products = [], total = 0)
    @products = products
    @total    = total
  end

  def best_result
    find_best_match
  end

  private

  def find_best_match
    best_matches = products.sort_by(&:total).select { |pair| pair[:total] <= total.to_i }
    return 'Not Possible' if best_matches.empty?

    best_matches.last.to_s
  end
end
