require_relative 'client'

client = Exchange::Api::Client.new

# p client.get_info(boom: 'zap')

p client.post_info({boom: "zap"}.to_json)
