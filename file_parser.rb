# Module to fetch data from a file and turn into an array
module FileParser
  class << self
    def extract(file, split_on = "\n")
      raise "#{file} was given, but could not be found!" unless File.file?(file)

      File.read(file).split(split_on)
    end
  end
end
