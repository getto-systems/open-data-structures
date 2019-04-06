require "minitest/autorun"

require "chapter2/dual_array_deque"

module OpenDataStructures::Chapter2
  class DualArrayDequeTest < Minitest::Test
    def test_set_and_get
      dual_array_deque = DualArrayDeque.new
      dual_array_deque.add(0,nil)
      dual_array_deque.add(0,nil)

      dual_array_deque[0] = :a

      assert_equal :a, dual_array_deque[0]

      dual_array_deque[1] = :b

      assert_equal :a, dual_array_deque[0]
      assert_equal :b, dual_array_deque[1]
    end

    def test_add_and_remove
      dual_array_deque = DualArrayDeque.new

      dual_array_deque.add(0,:a)
      assert_equal :a, dual_array_deque[0]

      dual_array_deque.add(0,:b)
      assert_equal :b, dual_array_deque[0]
      assert_equal :a, dual_array_deque[1]

      dual_array_deque.add(0,:c)
      assert_equal :c, dual_array_deque[0]
      assert_equal :b, dual_array_deque[1]
      assert_equal :a, dual_array_deque[2]

      assert_equal :c, dual_array_deque.remove(0)
      assert_equal :b, dual_array_deque[0]
      assert_equal :a, dual_array_deque[1]

      assert_equal :b, dual_array_deque.remove(0)
      assert_equal :a, dual_array_deque[0]

      assert_equal :a, dual_array_deque.remove(0)
    end

    def test_resize
      dual_array_deque = DualArrayDeque.new

      dual_array_deque.add(0,:a)
      dual_array_deque.add(0,:b)
      dual_array_deque.add(0,:c)
      dual_array_deque.add(0,:d)
      dual_array_deque.add(0,:e)
      dual_array_deque.add(0,:f)

      assert_equal [:f,:e,:d,:c,:b,:a],
        [
          dual_array_deque.remove(0),
          dual_array_deque.remove(0),
          dual_array_deque.remove(0),
          dual_array_deque.remove(0),
          dual_array_deque.remove(0),
          dual_array_deque.remove(0),
        ]
    end
  end
end
