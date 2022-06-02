require './file_parser'
require 'tempfile'
require 'rspec'

RSpec.describe "FileParser" do 
  subject { FileParser::extract('prices.txt') }

  it "parses test file correctly" do 
    expect(subject).to eq(["Candy Bar, 500", "Paperback Book, 700", "Detergent, 1000", "Headphones, 1400", "Earmuffs, 2000", "Bluetooth Stereo, 6000"])
  end
end