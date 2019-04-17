require "minitest/autorun"

require "chapter3/practice/min_stack"

module OpenDataStructures::Chapter3
  module Practice
    class MinStackTest < Minitest::Test
      def test_min_stack
        stack = MinStack.new

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
    end
  end
end
