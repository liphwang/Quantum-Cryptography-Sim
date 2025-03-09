module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Hash 5789
# Hash 6059
# Hash 9995
# Hash 4059
# Hash 4258
# Hash 1853
# Hash 2252
# Hash 9219
# Hash 8231
# Hash 2241
# Hash 3499
# Hash 5299
# Hash 6449
# Hash 4821
# Hash 6651
# Hash 7165
# Hash 8538
# Hash 8302
# Hash 9762
# Hash 4898
# Hash 6944
# Hash 9750
# Hash 7371
# Hash 9591
# Hash 2076
# Hash 1237
# Hash 7750
# Hash 6664
# Hash 3203
# Hash 9280
# Hash 9243
# Hash 2952
# Hash 7636
# Hash 6952
# Hash 2987
# Hash 8601
# Hash 7777
# Hash 3892