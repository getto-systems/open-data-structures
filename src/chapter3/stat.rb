require "benchmark"
require "csv"

module OpenDataStructures
  module Chapter3
    class Stat
      def initialize(klass,args=[])
        @klass = klass
        @args = args
      end

      private

        def start(label, &block)
          instance = @klass.new(*@args)

          file = "#{@klass.to_s.split("::").last}-#{label}"
          CSV.open("data/chapter3/#{file}.csv","wb") do |csv|
            csv << header
            block.call(instance,csv)
          end
        end

        def header
          [
            "count",
            "update",
            "get",
          ]
        end
        def rows_after(instance, count, unit, update_proc, get_proc)
          update = Benchmark.measure{
            unit.times do |i|
              update_proc.call(count*unit + i)
            end
          }

          get = Benchmark.measure{
            unit.times do |i|
              get_proc.call(count*unit + i)
            end
          }

          [
            count,
            update.utime,
            get.utime,
          ]
        end
        def rows_before(instance, count, unit, update_proc, get_proc)
          get = Benchmark.measure{
            unit.times do |i|
              get_proc.call(count*unit + i)
            end
          }

          update = Benchmark.measure{
            unit.times do |i|
              update_proc.call(count*unit + i)
            end
          }

          [
            count,
            update.utime,
            get.utime,
          ]
        end
    end
  end
end
