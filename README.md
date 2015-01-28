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

**WARNING:** You must enable Google Contacts API and Google Plus API when creating client, https://console.developers.google.com.


Pre-Configure Noxy:

    Noxy.configure do | option |
      option.app     = "SoundFruit"
      option.client  = "foo"
      option.secret  = "bar20oo0)"
      option.session = "some.shared.common.secret"
      option.proxy   = -> { check(authorization)}
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

        # authorization hash is available.
        authorization.info.email
      }
    end

Following helpers available

    class Foo < Sinatra::Base
      ...
      before do
        unless authorized?
          halt 401
        end
      end


      get "/hit" do
        "Hit the dog"
      end
    end


To redirect to Google Auth page, visit this link

    a href=("/auth/google_oauth2") Inloggen


By default the following routes are defined:

    [GET]  /auth/google_oauth2/callback
    [POST] /auth/google_oauth2/callback

Both are needed for handling the callback from Google.
When the callback from Google is completed the `Noxy.proxy` will be called.



## Todo (3.1.2)

  * Make path in cookie configurable (./lib/noxy/sinatra.rb)
  * Clean up test / example Sinatra app for push
  * Write more specs.

  * Make secreat / client_id readable from custom location
    ,i.e: ~/.secure/app/.

## Contributing

1. Fork it ( https://github.com/amaniak/noxy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
