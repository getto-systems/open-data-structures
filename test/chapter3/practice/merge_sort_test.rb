require "minitest/autorun"

require "chapter3/practice/merge_sort"

module OpenDataStructures::Chapter3
  module Practice
    class MergeSortTest < Minitest::Test
      using MergeSort

      def test_take_first
        listA = DLList.new
        listB = DLList.new

        listA.push :a
        listA.push :b
        listA.push :c

        listB.push :d
        listB.push :e

        listA.take_first! listB

        assert_equal 4, listA.length
        assert_equal 1, listB.length

        assert_equal [:a,:b,:c,:d],
          [
            listA[0],
            listA[1],
            listA[2],
            listA[3],
          ]

        assert_equal [:e],
          [
            listB[0],
          ]
      end

      def test_merge
        listA = DLList.new
        listB = DLList.new

        listA.push :a
        listA.push :c
        listA.push :e

        listB.push :b
        listB.push :d

        list = DLList.merge listA, listB

        assert_equal 5, list.length
        assert_equal 0, listA.length
        assert_equal 0, listB.length

        assert_equal [:a,:b,:c,:d,:e],
          [
            list[0],
            list[1],
            list[2],
            list[3],
            list[4],
          ]
      end

      def test_merge_all_over
        listA = DLList.new
        listB = DLList.new

        listA.push :a
        listA.push :b
        listA.push :c

        listB.push :d
        listB.push :e

        list = DLList.merge listA, listB

        assert_equal 5, list.length
        assert_equal 0, listA.length
        assert_equal 0, listB.length

        assert_equal [:a,:b,:c,:d,:e],
          [
            list[0],
            list[1],
            list[2],
            list[3],
            list[4],
          ]
      end

      def test_merge_all_under
        listA = DLList.new
        listB = DLList.new

        listA.push :d
        listA.push :e

        listB.push :a
        listB.push :b
        listB.push :c

        list = DLList.merge listA, listB

        assert_equal 5, list.length
        assert_equal 0, listA.length
        assert_equal 0, listB.length

        assert_equal [:a,:b,:c,:d,:e],
          [
            list[0],
            list[1],
            list[2],
            list[3],
            list[4],
          ]
      end

      def test_merge_same
        listA = DLList.new
        listB = DLList.new

        listA.push :a
        listA.push :c
        listA.push :e

        listB.push :c
        listB.push :d

        list = DLList.merge listA, listB

        assert_equal 5, list.length
        assert_equal 0, listA.length
        assert_equal 0, listB.length

        assert_equal [:a,:c,:c,:d,:e],
          [
            list[0],
            list[1],
            list[2],
            list[3],
            list[4],
          ]
      end

      def test_merge_empty
        listA = DLList.new
        listB = DLList.new

        listA.push :a
        listA.push :b
        listA.push :c

        list = DLList.merge listA, listB

        assert_equal 3, list.length
        assert_equal 0, listA.length
        assert_equal 0, listB.length

        assert_equal [:a,:b,:c],
          [
            list[0],
            list[1],
            list[2],
          ]
      end

      def test_merge_to_empty
        listA = DLList.new
        listB = DLList.new

        listB.push :a
        listB.push :b
        listB.push :c

        list = DLList.merge listA, listB

        assert_equal 3, list.length
        assert_equal 0, listA.length
        assert_equal 0, listB.length

        assert_equal [:a,:b,:c],
          [
            list[0],
            list[1],
            list[2],
          ]
      end

      def test_sort
        list = DLList.new

        list.push :c
        list.push :f
        list.push :a
        list.push :b
        list.push :g
        list.push :d
        list.push :e

        list.sort!

        assert_equal [:a,:b,:c,:d,:e,:f,:g],
          [
            list[0],
            list[1],
            list[2],
            list[3],
            list[4],
            list[5],
            list[6],
          ]
      end
    end
  end
end
