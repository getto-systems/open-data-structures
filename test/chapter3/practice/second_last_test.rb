require "minitest/autorun"

require "chapter3/practice/second_last"

module OpenDataStructures::Chapter3
  module Practice
    class SLListTest < Minitest::Test
      using SecondLast

      def test_second_last
        list = SLList.new
        list.push :a
        list.push :b
        list.push :c
        list.push :d

        assert_equal :c, list.second_last
      end

      def test_second_last_short
        list = SLList.new
        list.push :a

        assert_nil list.second_last
      end
    end
  end
end
