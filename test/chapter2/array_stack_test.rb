require "minitest/autorun"

require "chapter2/array_stack"

module OpenDataStructures::Chapter2
  class ArrayStackTest < Minitest::Test
    def test_set_and_get
      array_stack = ArrayStack.new
      array_stack.add(0,nil)
      array_stack.add(0,nil)

      array_stack[0] = :a

      assert_equal :a, array_stack[0]

      array_stack[1] = :b

      assert_equal :a, array_stack[0]
      assert_equal :b, array_stack[1]
    end

    def test_add_and_remove
      array_stack = ArrayStack.new

      array_stack.add(0,:a)
      assert_equal :a, array_stack[0]

      array_stack.add(0,:b)
      assert_equal :b, array_stack[0]
      assert_equal :a, array_stack[1]

      array_stack.add(0,:c)
      assert_equal :c, array_stack[0]
      assert_equal :b, array_stack[1]
      assert_equal :a, array_stack[2]

      assert_equal :c, array_stack.remove(0)
      assert_equal :b, array_stack[0]
      assert_equal :a, array_stack[1]

      assert_equal :b, array_stack.remove(0)
      assert_equal :a, array_stack[0]

      assert_equal :a, array_stack.remove(0)
    end
  end
end
