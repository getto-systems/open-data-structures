require "minitest/autorun"

require "chapter2/array_deque"

module OpenDataStructures::Chapter2
  class ArrayDequeTest < Minitest::Test
    def test_set_and_get
      array_deque = ArrayDeque.new
      array_deque.add(0,nil)
      array_deque.add(0,nil)

      array_deque[0] = :a

      assert_equal :a, array_deque[0]

      array_deque[1] = :b

      assert_equal :a, array_deque[0]
      assert_equal :b, array_deque[1]
    end

    def test_add_and_remove
      array_deque = ArrayDeque.new

      array_deque.add(0,:a)
      assert_equal :a, array_deque[0]

      array_deque.add(0,:b)
      assert_equal :b, array_deque[0]
      assert_equal :a, array_deque[1]

      array_deque.add(0,:c)
      assert_equal :c, array_deque[0]
      assert_equal :b, array_deque[1]
      assert_equal :a, array_deque[2]

      assert_equal :c, array_deque.remove(0)
      assert_equal :b, array_deque[0]
      assert_equal :a, array_deque[1]

      assert_equal :b, array_deque.remove(0)
      assert_equal :a, array_deque[0]

      assert_equal :a, array_deque.remove(0)
    end

    def test_resize
      array_stack = ArrayDeque.new

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
