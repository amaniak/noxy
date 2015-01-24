module Noxy
  module Configuration

    LOCK = Mutex.new

    extend self
    extend Options

    option :app,     default: ""
    option :session, default: ""
    option :client,  default: ""
    option :secret,  default: ""
    option :proxy,   default: -> {}

    def options=(options)

      # Mutex for future threaded env.
      LOCK.synchronize do
        if options
          options.each_pair do |option, value|
            send("#{option}=", value)
          end
        end
      end

    end
  end
end