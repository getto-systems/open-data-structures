require "minitest/autorun"

require "chapter3/practice/reverse"

module OpenDataStructures::Chapter3
  module Practice
    class ReverseTest < Minitest::Test
      using Reverse

      def test_reverse_sl_list
        list = SLList.new
        list.push :a
        list.push :b
        list.push :c
        list.push :d

        list.reverse!

        assert_equal [:d,:c,:b,:a],
          [
            list[0],
            list[1],
            list[2],
            list[3],
          ]
      end

      def test_reverse_dl_list
        list = DLList.new
        list.push :a
        list.push :b
        list.push :c
        list.push :d

        list.reverse!

        assert_equal [:d,:c,:b,:a],
          [
            list[0],
            list[1],
            list[2],
            list[3],
          ]
      end
    end
  end
end
