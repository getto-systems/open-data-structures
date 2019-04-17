require "minitest/autorun"

require "chapter3/practice/deal"

module OpenDataStructures::Chapter3
  module Practice
    class DealTest < Minitest::Test
      using Deal

      def test_deal
        list = DLList.new

        list.push :a
        list.push :b
        list.push :c
        list.push :d
        list.push :e

        even = list.deal!

        assert_equal 3, list.length
        assert_equal 2, even.length

        assert_equal [:a,:c,:e],
          [
            list[0],
            list[1],
            list[2],
          ]

        assert_equal [:b,:d],
          [
            even[0],
            even[1],
          ]
      end

      def test_deal_empty
        list = DLList.new

        even = list.deal!

        assert_equal 0, list.length
        assert_equal 0, even.length
      end
    end
  end
end
