require "noxy"

module Noxy
  module Auth

    # helpers
    module Helpers

      def authorized?
        !session['authorized']
      end

      def authorization
        request.env['omniauth.auth']
      end

    end

    # After register callback when Noxy
    # is embedded in a Sinatra app.
    # @param app [Hash] Base app.
    # @return [Void]

    def self.registered(app)

      # Noxy
      app.set :noxy, Proc.new { Noxy }

      # Create a session cookie: store
      # auth data securely accross multiple domains.

      app.use Rack::Session::Cookie,
              key: "#{app.noxy.app}.noxy.session",
              secret: "#{app.noxy.session}",
              path: '/'

      # plug and play OmniAuth - Google OAuth2
      app.use OmniAuth::Builder do
        provider :google_oauth2, app.noxy.client, app.noxy.secret
      end

      # define proxy lambda, so the proxy lambda,
      # from Noxy is configurable and
      # is executed on app instance.

      proxy = -> { self.instance_exec &app.noxy.proxy }

      # setup, make sure it's handled on GET and POST
      app.get  '/auth/:name/callback',  &proxy
      app.post '/auth/:name/callback',  &proxy


      # set module as helper
      app.helpers Helpers

    end
  end
end