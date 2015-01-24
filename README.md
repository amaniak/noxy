# Noxy

A simple gem for handling Google Domain Authorization.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'noxy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install noxy

## Usage

Pre-Configure Noxy:

    Noxy.configure do | option |
      option.app     = "SoundFruit"
      option.client  = "foo"
      option.secret  = "bar20oo0)"
      option.session = "some.shared.common.secret"
      option.proxy   = -> { check(request.env['omniauth.auth'])}
    end

Add Noxy to a Sinara app.

    class Foo < Sinatra::Base
      register Noxy::Auth
    end

Configure Noxy from a Sinara app.

    class Foo < Sinatra::Base
      ...
      noxy.app   = "DogSmash"
      noxy.proxy = -> {
        auth = request.env['omniauth.auth']
        check(auth.info.email)
      }
    end

By default the following routes are defined:

    [GET]  /auth/google_oauth2/callback
    [POST] /auth/google_oauth2/callback

Both are needed for handling the callback from Google.
When the callback from Google is completed the `Noxy.proxy` will be called.

## Todo

  * Make path in cookie configurable (./lib/noxy/sinatra.rb)
  * Clean up test / example Sinatra app for push
  * Write more specs.

## Contributing

1. Fork it ( https://git.noxqsapp.nl/dknl/noxy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
