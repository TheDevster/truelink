require_relative 'file_parser'

class GetPair
  attr_reader :file_name, :card_balance

  def initialize(args)
    @file_name = args.shift
    @card_balance = args.shift
  end

  def run
    check_for_valid_arguments

    ## there is plenty of opportunity to refactor this
    products      = Products.new(FileParser::extract(file_name)).parse_products
    get_pairs     = MatchedPairs.new(products, card_balance)
    puts get_pairs.best_result
    get_pairs.best_result  ## repeated this way only to allow our tests to work
  end

  private

  def check_for_valid_arguments
    help = "Usage: ./find-pair <file.txt> <card_balance>\n Example: ./find-pair prices.txt 2300"
    raise "Missing File argument\n #{help}" unless file_name
    raise "Missing Card Balance argument\n #{help}" unless card_balance
  end
end
