# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_attrs/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_attrs"
  spec.version       = SimpleAttrs::VERSION
  spec.authors       = ["Jennifer Reyes"]
  spec.email         = ["jgdreyes@gmail.com"]
  spec.summary       = %q{Simple attrs DSL}
  spec.description   = %q{DSL for adding attributes to any plain old ruby object.}
  spec.homepage      = "codeshoppe.github.io/simple_attrs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
end
