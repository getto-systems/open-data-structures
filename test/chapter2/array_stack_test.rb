require "minitest/autorun"

require "chapter2/array_stack"

module OpenDataStructures::Chapter2
  class ArrayStackTest < Minitest::Test
    def test_set_and_get
      array_stack = ArrayStack.new
      array_stack.add(0,:x)
      array_stack.add(0,:y)

      assert_equal :y, array_stack.set(0,:a)
      assert_equal :a, array_stack.get(0)

      assert_equal :x, array_stack.set(1,:b)
      assert_equal :a, array_stack.get(0)
      assert_equal :b, array_stack.get(1)
    end

    def test_add_and_remove
      array_stack = ArrayStack.new

      array_stack.add(0,:a)
      assert_equal :a, array_stack.get(0)

      array_stack.add(0,:b)
      assert_equal :b, array_stack.get(0)
      assert_equal :a, array_stack.get(1)

      array_stack.add(0,:c)
      assert_equal :c, array_stack.get(0)
      assert_equal :b, array_stack.get(1)
      assert_equal :a, array_stack.get(2)

      assert_equal :c, array_stack.remove(0)
      assert_equal :b, array_stack.get(0)
      assert_equal :a, array_stack.get(1)

      assert_equal :b, array_stack.remove(0)
      assert_equal :a, array_stack.get(0)

      assert_equal :a, array_stack.remove(0)
    end
  end
end
