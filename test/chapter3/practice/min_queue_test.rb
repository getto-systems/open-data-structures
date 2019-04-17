require "minitest/autorun"

require "chapter3/practice/min_queue"

module OpenDataStructures::Chapter3
  module Practice
    class MinQueueTest < Minitest::Test
      def test_min_queue
        queue = MinQueue.new

        queue.push :e; assert_equal :e, queue.min
        queue.push :d; assert_equal :d, queue.min
        queue.push :c; assert_equal :c, queue.min
        queue.push :b; assert_equal :b, queue.min
        queue.push :e; assert_equal :b, queue.min
        queue.push :a; assert_equal :a, queue.min
        queue.push :b; assert_equal :a, queue.min
        queue.push :c; assert_equal :a, queue.min
        queue.push :a; assert_equal :a, queue.min
        queue.push :d; assert_equal :a, queue.min

        assert_equal 10, queue.length

        assert_equal :e, queue.shift; assert_equal :a, queue.min
        assert_equal :d, queue.shift; assert_equal :a, queue.min
        assert_equal :c, queue.shift; assert_equal :a, queue.min
        assert_equal :b, queue.shift; assert_equal :a, queue.min
        assert_equal :e, queue.shift; assert_equal :a, queue.min
        assert_equal :a, queue.shift; assert_equal :a, queue.min
        assert_equal :b, queue.shift; assert_equal :a, queue.min
        assert_equal :c, queue.shift; assert_equal :a, queue.min
        assert_equal :a, queue.shift; assert_equal :d, queue.min
        assert_equal :d, queue.shift; assert_nil queue.min

        assert_equal 0, queue.length
      end
    end
  end
end
