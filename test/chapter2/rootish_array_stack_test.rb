require "minitest/autorun"

require "chapter2/rootish_array_stack"

module OpenDataStructures::Chapter2
  class RootishArrayStackTest < Minitest::Test
    def test_set_and_get
      rootish_array_stack = RootishArrayStack.new
      rootish_array_stack.add(0,nil)
      rootish_array_stack.add(0,nil)

      rootish_array_stack[0] = :a

      assert_equal :a, rootish_array_stack[0]

      rootish_array_stack[1] = :b

      assert_equal :a, rootish_array_stack[0]
      assert_equal :b, rootish_array_stack[1]
    end

    def test_add_and_remove
      rootish_array_stack = RootishArrayStack.new

      rootish_array_stack.add(0,:a)
      assert_equal :a, rootish_array_stack[0]

      rootish_array_stack.add(0,:b)
      assert_equal :b, rootish_array_stack[0]
      assert_equal :a, rootish_array_stack[1]

      rootish_array_stack.add(0,:c)
      assert_equal :c, rootish_array_stack[0]
      assert_equal :b, rootish_array_stack[1]
      assert_equal :a, rootish_array_stack[2]

      assert_equal :c, rootish_array_stack.remove(0)
      assert_equal :b, rootish_array_stack[0]
      assert_equal :a, rootish_array_stack[1]

      assert_equal :b, rootish_array_stack.remove(0)
      assert_equal :a, rootish_array_stack[0]

      assert_equal :a, rootish_array_stack.remove(0)
    end

    def test_resize
      rootish_array_stack = RootishArrayStack.new

      rootish_array_stack.add(0,:a)
      rootish_array_stack.add(0,:b)
      rootish_array_stack.add(0,:c)
      rootish_array_stack.add(0,:d)
      rootish_array_stack.add(0,:e)
      rootish_array_stack.add(0,:f)

      assert_equal [:f,:e,:d,:c,:b,:a],
        [
          rootish_array_stack.remove(0),
          rootish_array_stack.remove(0),
          rootish_array_stack.remove(0),
          rootish_array_stack.remove(0),
          rootish_array_stack.remove(0),
          rootish_array_stack.remove(0),
        ]
    end
  end
end
