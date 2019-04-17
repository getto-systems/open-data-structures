require "minitest/autorun"

require "chapter3/sl_list"

module OpenDataStructures::Chapter3
  class SLListTest < Minitest::Test
    def test_set_and_get
      list = SLList.new
      list.add(0,nil)
      list.add(0,nil)

      list[0] = :a

      assert_equal :a, list[0]

      list[1] = :b

      assert_equal :a, list[0]
      assert_equal :b, list[1]
    end

    def test_add_and_remove
      list = SLList.new

      list.add(0,:a)
      assert_equal :a, list[0]

      list.add(0,:b)
      assert_equal :b, list[0]
      assert_equal :a, list[1]

      list.add(0,:c)
      assert_equal :c, list[0]
      assert_equal :b, list[1]
      assert_equal :a, list[2]

      assert_equal :c, list.remove(0)
      assert_equal :b, list[0]
      assert_equal :a, list[1]

      assert_equal :b, list.remove(0)
      assert_equal :a, list[0]

      assert_equal :a, list.remove(0)
    end

    def test_add_and_remove_at_last
      list = SLList.new

      list.add(0,:a)
      assert_equal :a, list[0]

      list.add(1,:b)
      assert_equal :a, list[0]
      assert_equal :b, list[1]

      list.add(2,:c)
      assert_equal :a, list[0]
      assert_equal :b, list[1]
      assert_equal :c, list[2]

      assert_equal :c, list.remove(2)
      assert_equal :a, list[0]
      assert_equal :b, list[1]

      assert_equal :b, list.remove(1)
      assert_equal :a, list[0]

      assert_equal :a, list.remove(0)
    end
  end
end
