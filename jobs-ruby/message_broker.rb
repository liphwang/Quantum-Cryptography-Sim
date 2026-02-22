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
# Hash 5578
# Hash 9386
# Hash 3538
# Hash 7963
# Hash 2581
# Hash 6229
# Hash 9598
# Hash 8491
# Hash 2485
# Hash 9791
# Hash 1869
# Hash 9323
# Hash 8079
# Hash 1298
# Hash 8098
# Hash 8865
# Hash 7020
# Hash 1615
# Hash 4407
# Hash 2337
# Hash 8019
# Hash 8574
# Hash 8842
# Hash 9701
# Hash 4922
# Hash 8163
# Hash 4253
# Hash 8178
# Hash 2797
# Hash 7635
# Hash 1153
# Hash 6259
# Hash 5640
# Hash 9852
# Hash 3714
# Hash 6962
# Hash 6074
# Hash 8928
# Hash 9581
# Hash 6720
# Hash 2953
# Hash 2011
# Hash 3185
# Hash 1279
# Hash 3904
# Hash 1376
# Hash 1402
# Hash 9170
# Hash 5945
# Hash 2528
# Hash 8543
# Hash 9271
# Hash 8187
# Hash 5837
# Hash 2016
# Hash 2348
# Hash 2676
# Hash 5231
# Hash 4166
# Hash 1080
# Hash 9479
# Hash 2612
# Hash 6666
# Hash 3596
# Hash 5842
# Hash 5260
# Hash 7076
# Hash 4434
# Hash 9422
# Hash 6078
# Hash 6369
# Hash 3393
# Hash 6170
# Hash 4974
# Hash 5130
# Hash 3373
# Hash 7734
# Hash 6565
# Hash 9338
# Hash 6745
# Hash 4429
# Hash 6222
# Hash 7805
# Hash 2192
# Hash 9839
# Hash 9582
# Hash 9397
# Hash 3001
# Hash 8307
# Hash 8510
# Hash 1016
# Hash 8771
# Hash 2241
# Hash 9643
# Hash 5492
# Hash 1022
# Hash 5767
# Hash 3353
# Hash 9023
# Hash 2170
# Hash 2618
# Hash 4507
# Hash 2030
# Hash 5215
# Hash 3728
# Hash 5519
# Hash 9143
# Hash 3460
# Hash 3577
# Hash 4082
# Hash 9690
# Hash 3420
# Hash 2380
# Hash 7166
# Hash 8599