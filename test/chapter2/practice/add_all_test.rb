require "minitest/autorun"

require "chapter2/practice/add_all"

module OpenDataStructures::Chapter2
  module Practice
    class AddAllTest < Minitest::Test
      def test_add_all
        array = ArrayStack.new

        array.addAll(0,[:a,:b,:c,:d,:e])

        assert_equal [:a,:b,:c,:d,:e],
          [
            array.remove(0),
            array.remove(0),
            array.remove(0),
            array.remove(0),
          ]
      end

      def test_add_all
        array = ArrayStack.new

        array.addAll(0,[:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p])
        array.addAll(0,[:a,:b,:c,:d,:e])

        assert_equal [:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p],
          [
            array.remove(0),
            array.remove(0),
            array.remove(0),
            array.remove(0),
            array.remove(0),
            array.remove(0),
            array.remove(0),
            array.remove(0),
            array.remove(0),
            array.remove(0),
            array.remove(0),
            array.remove(0),
            array.remove(0),
            array.remove(0),
            array.remove(0),
            array.remove(0),
          ]
      end
    end
  end
end
