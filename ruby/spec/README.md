# Property based testing kata setup for Ruby

This is a setup for property based testing with [Rantly](https://github.com/hayeah/rantly).

## Installation

To install tools and libraries, use bundler.

```
gem install bundler`
bundle install
```

## RSPEC

To run examples, use rspec

```
$ rspec
```

It should have 1 failing test case.


## Cheat Sheet on Rantly

* generate a random number
```ruby
Rantly.integer         # a positive or negative integer
Rantly.range(lo,hi)    # random integer between lo and hi.
Rantly.choose(*vals)   # Pick one value from among vals.
```

* character classes for String are
```ruby
:alnum
:alpha
:blank
:cntrl
:digit
:graph
:lower
:print
:punct
:space
:upper
:xdigit
:ascii
```

* property assertions
```ruby
# checks that integer only generates fixnum.
property_of {
  integer  # generator
}.check { |i|
  assert_kind_of Integer, i, "integer property did not return Integer type"
}
```

## generators

Generators are used to create a valid/invalid input - a set of input values which should, when processed, 
hold a given property. For example - in CoinChanger, all input values more than 6 EUR should return more than
2 pieces of 2EUR coins.

So far the only way I have found to create custom generators is to patch Rantly instances:

```ruby
module CoinGenerator
  def coin_generator
    range(10,600) / 10 * 10
  end
  def a_random_coin
    Rantly{ coin_generator }
  end
end
# include generators to Rantly
class Rantly
  include CoinGenerator
end
```