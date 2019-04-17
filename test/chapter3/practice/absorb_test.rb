require "minitest/autorun"

require "chapter3/practice/absorb"

module OpenDataStructures::Chapter3
  module Practice
    class AbsorbTest < Minitest::Test
      using Absorb

      def test_absorb
        listA = DLList.new
        listB = DLList.new

        listA.push :a
        listA.push :b
        listA.push :c

        listB.push :d
        listB.push :e
        listB.push :f
        listB.push :g
        listB.push :h

        listA.absorb! listB

        assert_equal 8, listA.length
        assert_equal 0, listB.length

        assert_equal [:a,:b,:c,:d,:e,:f,:g,:h],
          [
            listA[0],
            listA[1],
            listA[2],
            listA[3],
            listA[4],
            listA[5],
            listA[6],
            listA[7],
          ]
      end

      def test_absorb_empty
        listA = DLList.new
        listB = DLList.new

        listA.push :a
        listA.push :b
        listA.push :c

        listA.absorb! listB

        assert_equal 3, listA.length
        assert_equal 0, listB.length

        assert_equal [:a,:b,:c],
          [
            listA[0],
            listA[1],
            listA[2],
          ]
      end

      def test_absorb_all
        listA = DLList.new
        listB = DLList.new

        listB.push :a
        listB.push :b
        listB.push :c

        listA.absorb! listB

        assert_equal 3, listA.length
        assert_equal 0, listB.length

        assert_equal [:a,:b,:c],
          [
            listA[0],
            listA[1],
            listA[2],
          ]
      end
    end
  end
end
