require "chapter2/array_queue"

require_relative "stat"

module OpenDataStructures::Chapter2
  class ArrayQueueStat < Stat
    def initialize
      super(ArrayQueue){|array_queue|
        array_queue.instance_variable_get(:@array).length - array_queue.length
      }
    end

    def dump(unit:, count:)
      dump_first(unit, count)
      dump_last(unit, count)
    end

    def dump_first(unit, count)
      start "first" do |instance,csv|
        count.times do |c|
          csv << rows(instance, c, unit){|i|
            instance.push(i)
          }
        end
        count.times do |c|
          csv << rows(instance, count - c, unit){|i|
            instance.shift
          }
        end
      end
    end

    def dump_last(unit, count)
      start "last" do |instance,csv|
        count.times do |c|
          csv << rows(instance, c, unit){|i|
            instance.unshift(i)
          }
        end
        count.times do |c|
          csv << rows(instance, count - c, unit){|i|
            instance.pop
          }
        end
      end
    end
  end

  ArrayQueueStat.new.dump unit: 100, count: 100
end
