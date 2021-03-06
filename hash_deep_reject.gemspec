# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hash_reject_recursively/version'

Gem::Specification.new do |spec|
  spec.name          = "hash_reject_recursively"
  spec.version       = HashRejectRecursively::VERSION
  spec.authors       = ["Rafael Biriba"]
  spec.email         = ["biribarj@gmail.com"]

  spec.summary       = "Like Hash#reject but recursively"
  spec.description   = "Deletes recursively every key-value pair from hash for which block evaluates to true."
  spec.homepage      = "https://github.com/rafaelbiriba/hash_reject_recursively"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "coveralls"
end
