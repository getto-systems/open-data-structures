require "chapter3/dl_list"

module OpenDataStructures::Chapter3
  module Practice
    class MinQueue
      def initialize
        @queue = DLList.new
        @min_queue = DLList.new
      end

      def push(value)
        @queue.push value

        while @min_queue.length > 0 and value < @min_queue[@min_queue.length - 1]
          @min_queue.pop
        end
        @min_queue.push value

        nil
      end

      def shift
        value = @queue.shift

        if value == @min_queue[0]
          @min_queue.shift
        end

        value
      end

      def length
        @queue.length
      end

      def min
        return nil if length == 0
        @min_queue[0]
      end
    end
  end
end
