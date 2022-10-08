require_relative 'request'

module Exchange
  module Api
    module Rest
      include Exchange::Api::Request

      def get_info(params = {})
        get('get', params)
      end

      def post_info(params)
        post('post', params)
      end
    end
  end
end