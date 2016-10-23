# Hash Reject Recursively

![Gem Version](https://img.shields.io/gem/v/hash_reject_recursively.svg?style=flat-square) [![Code Climate](https://img.shields.io/codeclimate/github/rafaelbiriba/hash_reject_recursively.svg?style=flat-square)](https://codeclimate.com/github/rafaelbiriba/hash_reject_recursively) [![Coverage Status](https://img.shields.io/coveralls/rafaelbiriba/hash_reject_recursively/master.svg?style=flat-square)](https://coveralls.io/r/rafaelbiriba/hash_reject_recursively?branch=master) [![Travis](https://img.shields.io/travis/rafaelbiriba/hash_reject_recursively/master.svg?style=flat-square)](https://travis-ci.org/rafaelbiriba/hash_reject_recursively)

Like Hash#reject but recursively.

Deletes recursively every key-value pair from hash for which block evaluates to true.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hash_reject_recursively'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_reject_recursively

## Usage

```ruby
languages = {
  ruby: { lines: 100 },
  python: { lines: nil },
  java: { lines: nil },
  php: nil
}

new_hash = languages.deep_reject { |key, value| value.nil? }
# new_hash == { ruby: { lines: 100 }, python: {}, java: {} }

new_hash = languages.deep_reject { |key, value| value.blank? } # Rails example
# new_hash == { ruby: { lines: 100 } }

languages.deep_reject! { |key, value| value.nil? }
# languages == { ruby: { lines: 100 }, python: {}, java: {} }

```

Note 1: `deep_reject!` changes the original object

Note 2: `.blank?` in example above it's [Rails implementation method](http://apidock.com/rails/Object/blank%3F).


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contributing

First of all, **thank you** for wanting to help!

1. [Fork it](https://help.github.com/articles/fork-a-repo).
2. Create a feature branch - `git checkout -b more_magic`
3. Add tests and make your changes
4. Check if tests are ok - `rake spec`
5. Commit changes - `git commit -am "Added more magic"`
6. Push to Github - `git push origin more_magic`
7. Send a [pull request](https://help.github.com/articles/using-pull-requests)! :heart:
