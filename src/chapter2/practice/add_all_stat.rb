require "chapter2/practice/add_all"

require_relative "../stat"

module OpenDataStructures::Chapter2
  module Practice
    class AddAllStat < Stat
      def initialize
        super(ArrayStack)
      end

      def dump(unit:, count:)
        dump_each(unit, count)
        dump_all(unit/10, count)
      end

      def dump_each(unit, count)
        start "each" do |instance,csv|
          count.times do |c|
            csv << rows(instance, c, unit){|i|
              instance.add(0,i)
            }
          end
        end
      end

      def dump_all(unit, count)
        start "all" do |instance,csv|
          count.times do |c|
            csv << rows(instance, c, unit){|i|
              instance.addAll(0,Array.new(10,i))
            }
          end
        end
      end
    end

    AddAllStat.new.dump unit: 100, count: 100
  end
end
