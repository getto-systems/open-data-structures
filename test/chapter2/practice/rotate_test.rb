require "minitest/autorun"

require "chapter2/practice/rotate"

module OpenDataStructures::Chapter2
  module Practice
    class RotateTest < Minitest::Test
      def test_rotate
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
    end
  end
end
