require "minitest/autorun"

require "chapter3/practice/rotate"

module OpenDataStructures::Chapter3
  module Practice
    class RotateTest < Minitest::Test
      using Rotate

      def test_rotate_under
        list = DLList.new

        list.push :a
        list.push :b
        list.push :c
        list.push :d
        list.push :e

        list.rotate!(1)

        assert_equal [:e,:a,:b,:c,:d],
          [
            list[0],
            list[1],
            list[2],
            list[3],
            list[4],
          ]
      end

      def test_rotate_over
        list = DLList.new

        list.push :a
        list.push :b
        list.push :c
        list.push :d
        list.push :e

        list.rotate!(3)

        assert_equal [:c,:d,:e,:a,:b],
          [
            list[0],
            list[1],
            list[2],
            list[3],
            list[4],
          ]
      end
    end
  end
end
