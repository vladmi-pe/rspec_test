require 'json'
require_relative 'connection'

module Exchange
  module Api
    module Request
      include Exchange::Api::Connection

      def get(path, params = {})
        respond_with(connect.get(path, params))
      end

      def post(path, params)
        respond_with(connect.post(path, params))
      end

      private

      def respond_with(response)
        JSON.parse(response.body)
      end
    end
  end
end