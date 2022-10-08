require 'faraday'

module Exchange
  module Api
    module Connection
      BASE_URL = 'http://httpbingo.org'

      def connect
        Faraday.new(url: BASE_URL, headers: {'Content-Type' => 'application/json'})
      end
    end
  end
end
