require "minitest/autorun"

require "chapter3/practice/min_deque"

module OpenDataStructures::Chapter3
  module Practice
    class MinDequeTest < Minitest::Test
      def setup
        skip "未実装 : 思いつかない"
      end

      def test_queue_left
        queue = MinDeque.new

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

      def test_queue_right
        queue = MinDeque.new

        queue.unshift :e; assert_equal :e, queue.min
        queue.unshift :d; assert_equal :d, queue.min
        queue.unshift :c; assert_equal :c, queue.min
        queue.unshift :b; assert_equal :b, queue.min
        queue.unshift :e; assert_equal :b, queue.min
        queue.unshift :a; assert_equal :a, queue.min
        queue.unshift :b; assert_equal :a, queue.min
        queue.unshift :c; assert_equal :a, queue.min
        queue.unshift :a; assert_equal :a, queue.min
        queue.unshift :d; assert_equal :a, queue.min

        assert_equal 10, queue.length

        assert_equal :e, queue.pop; assert_equal :a, queue.min
        assert_equal :d, queue.pop; assert_equal :a, queue.min
        assert_equal :c, queue.pop; assert_equal :a, queue.min
        assert_equal :b, queue.pop; assert_equal :a, queue.min
        assert_equal :e, queue.pop; assert_equal :a, queue.min
        assert_equal :a, queue.pop; assert_equal :a, queue.min
        assert_equal :b, queue.pop; assert_equal :a, queue.min
        assert_equal :c, queue.pop; assert_equal :a, queue.min
        assert_equal :a, queue.pop; assert_equal :d, queue.min
        assert_equal :d, queue.pop; assert_nil queue.min

        assert_equal 0, queue.length
      end

      def test_stack_left
        stack = MinDeque.new

        stack.push :e; assert_equal :e, stack.min
        stack.push :d; assert_equal :d, stack.min
        stack.push :c; assert_equal :c, stack.min
        stack.push :b; assert_equal :b, stack.min
        stack.push :e; assert_equal :b, stack.min
        stack.push :a; assert_equal :a, stack.min
        stack.push :b; assert_equal :a, stack.min
        stack.push :c; assert_equal :a, stack.min
        stack.push :a; assert_equal :a, stack.min
        stack.push :d; assert_equal :a, stack.min

        assert_equal 10, stack.length

        assert_equal :d, stack.pop; assert_equal :a, stack.min
        assert_equal :a, stack.pop; assert_equal :a, stack.min
        assert_equal :c, stack.pop; assert_equal :a, stack.min
        assert_equal :b, stack.pop; assert_equal :a, stack.min
        assert_equal :a, stack.pop; assert_equal :b, stack.min
        assert_equal :e, stack.pop; assert_equal :b, stack.min
        assert_equal :b, stack.pop; assert_equal :c, stack.min
        assert_equal :c, stack.pop; assert_equal :d, stack.min
        assert_equal :d, stack.pop; assert_equal :e, stack.min
        assert_equal :e, stack.pop; assert_nil stack.min

        assert_equal 0, stack.length
      end

      def test_stack_right
        stack = MinDeque.new

        stack.unshift :e; assert_equal :e, stack.min
        stack.unshift :d; assert_equal :d, stack.min
        stack.unshift :c; assert_equal :c, stack.min
        stack.unshift :b; assert_equal :b, stack.min
        stack.unshift :e; assert_equal :b, stack.min
        stack.unshift :a; assert_equal :a, stack.min
        stack.unshift :b; assert_equal :a, stack.min
        stack.unshift :c; assert_equal :a, stack.min
        stack.unshift :a; assert_equal :a, stack.min
        stack.unshift :d; assert_equal :a, stack.min

        assert_equal 10, stack.length

        assert_equal :d, stack.shift; assert_equal :a, stack.min
        assert_equal :a, stack.shift; assert_equal :a, stack.min
        assert_equal :c, stack.shift; assert_equal :a, stack.min
        assert_equal :b, stack.shift; assert_equal :a, stack.min
        assert_equal :a, stack.shift; assert_equal :b, stack.min
        assert_equal :e, stack.shift; assert_equal :b, stack.min
        assert_equal :b, stack.shift; assert_equal :c, stack.min
        assert_equal :c, stack.shift; assert_equal :d, stack.min
        assert_equal :d, stack.shift; assert_equal :e, stack.min
        assert_equal :e, stack.shift; assert_nil stack.min

        assert_equal 0, stack.length
      end

      def test_deque
        queue = MinDeque.new

        queue.unshift :d; assert_equal :d, queue.min
        queue.push    :i; assert_equal :d, queue.min
        queue.unshift :c; assert_equal :c, queue.min
        queue.push    :h; assert_equal :c, queue.min
        queue.push    :g; assert_equal :c, queue.min
        queue.unshift :a; assert_equal :a, queue.min
        queue.push    :j; assert_equal :a, queue.min
        queue.push    :f; assert_equal :a, queue.min
        queue.unshift :e; assert_equal :a, queue.min
        queue.unshift :b; assert_equal :a, queue.min

        assert_equal 10, queue.length

        assert_equal :b, queue.unshift; assert_equal :a, queue.min
        assert_equal :f, queue.pop;     assert_equal :a, queue.min
        assert_equal :e, queue.unshift; assert_equal :a, queue.min
        assert_equal :j, queue.pop;     assert_equal :a, queue.min
        assert_equal :g, queue.pop;     assert_equal :a, queue.min
        assert_equal :h, queue.pop;     assert_equal :a, queue.min
        assert_equal :a, queue.unshift; assert_equal :c, queue.min
        assert_equal :i, queue.pop;     assert_equal :c, queue.min
        assert_equal :c, queue.unshift; assert_equal :d, queue.min
        assert_equal :d, queue.unshift; assert_nil queue.min

        assert_equal 0,  queue.length
      end
    end
  end
end
