require "minitest/autorun"

require "chapter3/dl_list"

module OpenDataStructures::Chapter3
  class DLListTest < Minitest::Test
    def test_set_and_get
      array = DLList.new
      array.add(0,nil)
      array.add(0,nil)

      array[0] = :a

      assert_equal :a, array[0]

      array[1] = :b

      assert_equal :a, array[0]
      assert_equal :b, array[1]
    end

    def test_add_and_remove
      array = DLList.new

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

    def test_add_and_remove_at_last
      array = DLList.new

      array.add(0,:a)
      assert_equal :a, array[0]

      array.add(1,:b)
      assert_equal :a, array[0]
      assert_equal :b, array[1]

      array.add(2,:c)
      assert_equal :a, array[0]
      assert_equal :b, array[1]
      assert_equal :c, array[2]

      assert_equal :c, array.remove(2)
      assert_equal :a, array[0]
      assert_equal :b, array[1]

      assert_equal :b, array.remove(1)
      assert_equal :a, array[0]

      assert_equal :a, array.remove(0)
    end
  end
end
