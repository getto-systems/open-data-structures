require "minitest/autorun"

require "chapter2/practice/rotate"

module OpenDataStructures::Chapter2
  module Practice
    using Rotate

    class RotateTest < Minitest::Test
      def test_backing_array
        array = BackingArray.new(length: 5)

        array[0] = :a
        array[1] = :b
        array[2] = :c
        array[3] = :d
        array[4] = :e

        rotate = array.rotate(3)

        assert_equal [:c,:d,:e,:a,:b],
          [
            rotate[0],
            rotate[1],
            rotate[2],
            rotate[3],
            rotate[4],
          ]
      end

      def test_array_stack
        array = ArrayStack.new

        array.push :a
        array.push :b
        array.push :c
        array.push :d
        array.push :e

        array.rotate!(3)

        assert_equal [:c,:d,:e,:a,:b],
          [
            array.shift,
            array.shift,
            array.shift,
            array.shift,
            array.shift,
          ]
      end

      def test_array_queue
        array = ArrayQueue.new

        array.push :a
        array.push :b
        array.push :c
        array.push :d
        array.push :e

        array.rotate!(3)

        assert_equal [:c,:d,:e,:a,:b],
          [
            array.shift,
            array.shift,
            array.shift,
            array.shift,
            array.shift,
          ]
      end

      def test_array_deque
        array = ArrayDeque.new

        array.push :a
        array.push :b
        array.push :c
        array.push :d
        array.push :e

        array.rotate!(3)

        assert_equal [:c,:d,:e,:a,:b],
          [
            array.shift,
            array.shift,
            array.shift,
            array.shift,
            array.shift,
          ]
      end

      def test_dual_array_deque_small
        array = DualArrayDeque.new

        array.push :a
        array.push :b
        array.push :c
        array.push :d
        array.push :e

        array.rotate!(2)

        assert_equal [:d,:e,:a,:b,:c],
          [
            array.shift,
            array.shift,
            array.shift,
            array.shift,
            array.shift,
          ]
      end

      def test_dual_array_deque_large
        array = DualArrayDeque.new

        array.push :a
        array.push :b
        array.push :c
        array.push :d
        array.push :e

        array.rotate!(3)

        assert_equal [:c,:d,:e,:a,:b],
          [
            array.shift,
            array.shift,
            array.shift,
            array.shift,
            array.shift,
          ]
      end

      def test_rootish_array_stack
        skip "未実装 : 思いつかない"
        array = RootishArrayStack.new

        array.push :a
        array.push :b
        array.push :c
        array.push :d
        array.push :e

        array.rotate!(3)

        assert_equal [:c,:d,:e,:a,:b],
          [
            array.shift,
            array.shift,
            array.shift,
            array.shift,
            array.shift,
          ]
      end

      def test_treque
        array = Treque.new

        array.push :a
        array.push :b
        array.push :c
        array.push :d
        array.push :e

        array.rotate!(3)

        assert_equal [:c,:d,:e,:a,:b],
          [
            array.shift,
            array.shift,
            array.shift,
            array.shift,
            array.shift,
          ]
      end
    end
  end
end
