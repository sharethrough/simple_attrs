# SimpleAttrs

The goal is to provide a simple DSL to define attributes for your
models.  SimpleAttrs does not support type checking, coercion or default
values.  For a more complex solution, look at these other great
libraries:
- [Attrs](https://github.com/wojtekmach/attrs)
- [Attrio](https://github.com/jetrockets/attrio)
- [Virtus](https://github.com/solnic/virtus)

## Features
- Adds a reader/write for each attribute using `attr_accessor`.
- Adds an initializer that takes in an options hash to define intial
  values.  The default initializer will ensure that the option hash only
includes values defined as a simple_attr.

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

## Contributing

1. Fork it ( https://github.com/codeshoppe/simple_attrs/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
