# SimpleAttrs

The goal is to provide a simple DSL to define attributes for your
models.

## Features
- Adds a reader/write for each attribute using `attr_accessor`.
- Adds an initializer that takes in an options hash to define intial
  values.  The default initializer will ensure that the option hash only
includes values defined as a simple_attr.

SimpleAttrs does not support type checking, coercion or default
values.  For a more complex solution, look at these other great
libraries: [Attrs](https://github.com/wojtekmach/attrs),
[Attrio](https://github.com/jetrockets/attrio), [Virtus](https://github.com/solnic/virtus)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_attrs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_attrs

## Usage

```ruby
require 'simple_attrs'

class SimpleExample
  include SimpleAttrs

  has_simple_attr :attr1
  has_simple_attr :attr2
  has_simple_attr :attr3
end

ex = SimpleExample.new(attr1: 1, attr2: 2)
ex.attributes
=> { attr1: 1, attr2: 2, attr3: nil }

ex = SimpleExample.new(invalid_attr: 1)
ArgumentError: Cannot set invalid_attr through initializer
```

## Performance
If you want a bare-bones attribute DSL, `simple_attrs` is the performant solution you've been looking for.  Check out the benchmarking code here: [simple_attrs_benchmark](https://github.com/codeshoppe/simple_attrs_benchmark).

Ran on MBP, Processor: 2.4GHz i5, Memory: 8GB

| Gem | 1 attr / 1 obj | 25 attrs / 1 obj | 1 attr / 100,000 objs | 25 attrs / 100,000 objs |
| ------------ | ------------ | ----------- | ------------ | ------------ |
| Attrio       |  `0.001390`  |  `0.000293` |  `1.234200`  |  `22.420148` |
| Attrs        |  `0.000013`  |  `0.000104` |  `0.177039`  |  `_4.367675` |
| Simple Attrs |  `0.000012`  |  `0.000010` |  `0.185468`  |  `_0.176154` |
| Virtus       |  `0.000256`  |  `0.000396` |  `0.763091`  |  `11.319977` |

`simple_attrs` can provide a huge performance gain if you plan on instantiating many objects.  

## Contributing

1. Fork it ( https://github.com/codeshoppe/simple_attrs/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
