require "minitest/autorun"

require "chapter3/practice/truncate"

module OpenDataStructures::Chapter3
  module Practice
    class TruncateTest < Minitest::Test
      using Truncate

      def test_truncate_under
        list = DLList.new
        list.push :a
        list.push :b
        list.push :c
        list.push :d
        list.push :e

        overflow = list.truncate! 2

        assert_equal 2, list.length
        assert_equal [:a,:b],
          [
            list[0],
            list[1],
          ]

        assert_equal 3, overflow.length
        assert_equal [:c,:d,:e],
          [
            overflow[0],
            overflow[1],
            overflow[2],
          ]
      end

      def test_truncate_over
        list = DLList.new
        list.push :a
        list.push :b
        list.push :c
        list.push :d
        list.push :e

        overflow = list.truncate! 3

        assert_equal 3, list.length
        assert_equal [:a,:b,:c],
          [
            list[0],
            list[1],
            list[2],
          ]

        assert_equal 2, overflow.length
        assert_equal [:d,:e],
          [
            overflow[0],
            overflow[1],
          ]
      end

      def test_truncate_all
        list = DLList.new
        list.push :a
        list.push :b
        list.push :c
        list.push :d
        list.push :e

        overflow = list.truncate! 0

        assert_equal 0, list.length

        assert_equal 5, overflow.length
        assert_equal [:a,:b,:c,:d,:e],
          [
            overflow[0],
            overflow[1],
            overflow[2],
            overflow[3],
            overflow[4],
          ]
      end

      def test_truncate_none
        list = DLList.new
        list.push :a
        list.push :b
        list.push :c
        list.push :d
        list.push :e

        overflow = list.truncate! 5

        assert_equal 5, list.length
        assert_equal [:a,:b,:c,:d,:e],
          [
            list[0],
            list[1],
            list[2],
            list[3],
            list[4],
          ]

        assert_equal 0, overflow.length
      end
    end
  end
end
