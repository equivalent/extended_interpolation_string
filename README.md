# ExtendedInterpolationString

When interpolating string with hash that includes lambda,
you can pass interpolator object upon which the lambda is
called before interpolating the hash.

```ruby
require 'ostruct'
user = OpenStruct.new(email_count: 20)

hello_string = 'hi %{user}, you have %{email_count} emails'

hello_string.class # => String
hello_string % { user: 'Joe', email_count: lambda { |user| user.email_count} }
# =>  "hi Joe, you have #<Proc:0x000000022a7928@(irb):9 (lambda)> emails"

# using this gem
extended_hello = hello_string.extended 
extended_hello.class # => ExtendedInterpolationString
extended_hello.interpolator = user
extended_hello % { user: 'Joe', email_count: lambda { |user| user.email_count} }
#  "hi Joe, you have 20 emails"
```

## Installation

Add this line to your application's Gemfile:

    gem 'extended_interpolation_string'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install extended_interpolation_string


## Contributing

1. Fork it ( https://github.com/[my-github-username]/extended_interpolation_string/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
