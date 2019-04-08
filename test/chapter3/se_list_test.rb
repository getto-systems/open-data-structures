require "minitest/autorun"

require "chapter3/se_list"

module OpenDataStructures::Chapter3
  class SEListTest < Minitest::Test
    def test_set_and_get
      list = SEList.new(block_size: 2)
      list.add(0,nil)
      list.add(0,nil)
      list.add(0,nil)

      list[0] = :a

      assert_equal :a, list[0]

      list[1] = :b

      assert_equal :a, list[0]
      assert_equal :b, list[1]

      list[2] = :c

      assert_equal :a, list[0]
      assert_equal :b, list[1]
      assert_equal :c, list[2]
    end

    def test_add_and_remove
      list = SEList.new(block_size: 2)

      list.add(0,:a)
      assert_equal :a, list[0]

      list.add(0,:b)
      assert_equal :b, list[0]
      assert_equal :a, list[1]

      list.add(0,:c)
      assert_equal :c, list[0]
      assert_equal :b, list[1]
      assert_equal :a, list[2]

      list.add(0,:d)
      assert_equal :d, list[0]
      assert_equal :c, list[1]
      assert_equal :b, list[2]
      assert_equal :a, list[3]

      assert_equal :d, list.remove(0)
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
      list = SEList.new(block_size: 2)

      list.add(0,:a)
      assert_equal :a, list[0]

      list.add(1,:b)
      assert_equal :a, list[0]
      assert_equal :b, list[1]

      list.add(2,:c)
      assert_equal :a, list[0]
      assert_equal :b, list[1]
      assert_equal :c, list[2]

      list.add(3,:d)
      assert_equal :a, list[0]
      assert_equal :b, list[1]
      assert_equal :c, list[2]
      assert_equal :d, list[3]

      assert_equal :d, list.remove(3)
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

    def test_resize
      list = SEList.new(block_size: 2)

      list.add(0,:a)
      list.add(0,:b)
      list.add(0,:c)
      list.add(0,:d)
      list.add(0,:e)
      list.add(0,:f)
      list.add(0,:g)

      assert_equal [:g,:f,:e,:d,:c,:b,:a],
        [
          list[0],
          list[1],
          list[2],
          list[3],
          list[4],
          list[5],
          list[6],
        ]

      assert_equal :g, list.remove(0)
      assert_equal :f, list.remove(0)
      assert_equal :e, list.remove(0)
      assert_equal :d, list.remove(0)
      assert_equal :c, list.remove(0)
      assert_equal :b, list.remove(0)
      assert_equal :a, list.remove(0)
    end

    def test_resize_last
      list = SEList.new(block_size: 2)

      list.add(0,:a)
      list.add(1,:b)
      list.add(2,:c)
      list.add(3,:d)
      list.add(4,:e)
      list.add(5,:f)
      list.add(6,:g)

      assert_equal [:a,:b,:c,:d,:e,:f,:g],
        [
          list[0],
          list[1],
          list[2],
          list[3],
          list[4],
          list[5],
          list[6],
        ]

      assert_equal :g, list.remove(6)
      assert_equal :f, list.remove(5)
      assert_equal :e, list.remove(4)
      assert_equal :d, list.remove(3)
      assert_equal :c, list.remove(2)
      assert_equal :b, list.remove(1)
      assert_equal :a, list.remove(0)
    end
  end
end
