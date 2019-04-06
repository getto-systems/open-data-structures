require "chapter2/practice/random_queue"

require_relative "../stat"

module OpenDataStructures::Chapter2
  module Practice
    class RandomQueueStat < Stat
      def initialize
        super(RandomQueue,[Random.new(1000)])
      end

      def dump(unit:, count:)
        start "random" do |instance,csv|
          count.times do |c|
            csv << rows(instance, c, unit){|i|
              instance.add(i)
            }
          end
          count.times do |c|
            csv << rows(instance, count - c, unit){|i|
              instance.remove
            }
          end
        end
      end
    end

    RandomQueueStat.new.dump unit: 100, count: 100
  end
end
