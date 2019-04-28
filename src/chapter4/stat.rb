require "benchmark"
require "csv"

module OpenDataStructures
  module Chapter4
    class Stat
      def initialize(klass, &new_instance)
        @klass = klass
        @new_instance = new_instance
      end

      private

        def start(label, &block)
          instance = new_instance

          file = "#{@klass.to_s.split("::").last}-#{label}"
          CSV.open("data/chapter4/#{file}.csv","wb") do |csv|
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
