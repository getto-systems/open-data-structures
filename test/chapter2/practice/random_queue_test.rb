require "minitest/autorun"

require "chapter2/practice/random_queue"

module OpenDataStructures::Chapter2
  module Practice
    class RandomQueueTest < Minitest::Test
      def test_resize
        array = RandomQueue.new(Random.new(1000))

        array.add(:a)
        array.add(:b)
        array.add(:c)
        array.add(:d)
        array.add(:e)

        assert_equal [:e,:d,:c,:b,:a],
          [
            array.remove,
            array.remove,
            array.remove,
            array.remove,
            array.remove,
          ]
      end
    end
  end
end
