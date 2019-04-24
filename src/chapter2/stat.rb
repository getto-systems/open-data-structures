require "benchmark"
require "csv"

module OpenDataStructures
  module Chapter2
    class Stat
      def initialize(klass, &new_instance)
        @klass = klass
        @new_instance = new_instance
      end

      private

        def start(label, &block)
          instance = new_instance

          file = "#{@klass.to_s.split("::").last}-#{label}"
          CSV.open("data/chapter2/#{file}.csv","wb") do |csv|
            csv << header
            block.call(instance,csv)
          end
        end

        def new_instance
          if @new_instance
            @new_instance.call
          else
            @klass.new
          end
        end

        def header
          [
            "count",
            "utime",
            "blank",
          ]
        end
        def rows(instance, count, unit, &block)
          time = Benchmark.measure{
            unit.times do |i|
              block.call(count*unit + i)
            end
          }
          [
            count,
            time.utime,
            instance.blank,
          ]
        end
    end
  end
end
