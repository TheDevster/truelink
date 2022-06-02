# Find-Pairs

Find-Pairs is a tool to find the best pair of products to spend the rest of your gift card balance on.

### Installation

This tool has a dependency on Ruby (version 3+) and RSpec (version 3.11).  Please ensure you have ruby and it is accessible from your command line 

Ruby
```bash
$ ruby -v
ruby 3.1.2p20
```
Rspec
```bash
$ rspec -v
RSpec 3.11
```

If you do not have Rspec please install it: 
```bash
$ gem install rspec
```

### Setup
```cmd
git clone https://github.com/TheDevster/truelink.git
cd ./truelink
```

### Usage
To use this tool you need to have a txt file of products and a balance amount (in cents).  An example txt file is included called `prices.txt`. You can execute the program by calling `Ruby find-pair` and passing the two arguments.  If you call the program with no arguments or not enough arguments it will respond with an error and usage instructions.

If you wish to use the shorthand, as exampled below, then you need to ensure find-pair is executable (for *nix/mac do `chmod a+x find-pair`)

```bash
$ ./find-pair prices.txt 1500
Candy Bar 500, Detergent 1000
```

### To Run Tests
To run the tests you only need to ensure you have rspec installed (as mentioned above) and type `rspec` in your command line.

```bash
$ rspec
........

Finished in 0.01916 seconds (files took 0.29044 seconds to load)
10 examples, 0 failures
```
