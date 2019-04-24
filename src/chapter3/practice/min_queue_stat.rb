require "chapter3/practice/min_queue"

require_relative "../stat"

module OpenDataStructures::Chapter3
  module Practice
    class MinQueueStat < Stat
      def initialize
        super(MinQueue)
      end

      def dump(unit:, count:)
        dump_first(unit, count)
      end

      def dump_first(unit, count)
        start "first" do |instance,csv|
          count.times do |c|
            csv << rows_after(
              instance, c, unit,
              ->(i){ instance.push @random.rand },
              ->(i){ [ instance.length, instance.min ] }
            )
          end
          count.times do |c|
            csv << rows_before(
              instance, count - c - 1, unit,
              ->(i){ instance.shift },
              ->(i){ [ instance.length, instance.min ] }
            )
          end
        end
      end
    end

    MinQueueStat.new.dump unit: 100, count: 100
  end
end
