require "minitest/autorun"

require "chapter2/rootish_array_stack"

module OpenDataStructures::Chapter2
  class RootishArrayStackTest < Minitest::Test
    def test_set_and_get
      array = RootishArrayStack.new
      array.add(0,nil)
      array.add(0,nil)

      array[0] = :a

      assert_equal :a, array[0]

      array[1] = :b

      assert_equal :a, array[0]
      assert_equal :b, array[1]
    end

    def test_add_and_remove
      array = RootishArrayStack.new

      array.add(0,:a)
      assert_equal :a, array[0]

      array.add(0,:b)
      assert_equal :b, array[0]
      assert_equal :a, array[1]

      array.add(0,:c)
      assert_equal :c, array[0]
      assert_equal :b, array[1]
      assert_equal :a, array[2]

      assert_equal :c, array.remove(0)
      assert_equal :b, array[0]
      assert_equal :a, array[1]

      assert_equal :b, array.remove(0)
      assert_equal :a, array[0]

      assert_equal :a, array.remove(0)
    end

    def test_resize
      array = ArrayDeque.new

      array.add(0,:a)
      array.add(0,:b)
      array.add(0,:c)
      array.add(0,:d)
      array.add(0,:e)
      array.add(0,:f)
      array.add(0,:g)
      array.add(0,:h)
      array.add(0,:i)
      array.add(0,:j)
      array.add(0,:k)
      array.add(0,:l)
      array.add(0,:m)
      array.add(0,:n)
      array.add(0,:o)
      array.add(0,:p)

      assert_equal [:p,:o,:n,:m,:l,:k,:j,:i,:h,:g,:f,:e,:d,:c,:b,:a],
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
