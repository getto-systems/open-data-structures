require "minitest/autorun"

require "chapter2/array_queue"

module OpenDataStructures::Chapter2
  class ArrayQueueTest < Minitest::Test
    def test_set_and_get
      array_queue = ArrayQueue.new
      array_queue.add(0,nil)
      array_queue.add(0,nil)

      array_queue[0] = :a

      assert_equal :a, array_queue[0]

      array_queue[1] = :b

      assert_equal :a, array_queue[0]
      assert_equal :b, array_queue[1]
    end

    def test_add_and_remove
      array_queue = ArrayQueue.new

      array_queue.add(0,:a)
      assert_equal :a, array_queue[0]

      array_queue.add(0,:b)
      assert_equal :b, array_queue[0]
      assert_equal :a, array_queue[1]

      array_queue.add(0,:c)
      assert_equal :c, array_queue[0]
      assert_equal :b, array_queue[1]
      assert_equal :a, array_queue[2]

      assert_equal :c, array_queue.remove(0)
      assert_equal :b, array_queue[0]
      assert_equal :a, array_queue[1]

      assert_equal :b, array_queue.remove(0)
      assert_equal :a, array_queue[0]

      assert_equal :a, array_queue.remove(0)
    end

    def test_resize
      array_stack = ArrayQueue.new

      array_stack.add(0,:a)
      array_stack.add(0,:b)
      array_stack.add(0,:c)
      array_stack.add(0,:d)
      array_stack.add(0,:e)
      array_stack.add(0,:f)

      assert_equal [:f,:e,:d,:c,:b,:a],
        [
          array_stack.remove(0),
          array_stack.remove(0),
          array_stack.remove(0),
          array_stack.remove(0),
          array_stack.remove(0),
          array_stack.remove(0),
        ]
    end
  end
end
