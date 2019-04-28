require "minitest/autorun"

require "chapter4/skiplist_sset"

module OpenDataStructures::Chapter4
  class SkiplistSSetTest < Minitest::Test
    def test_add_remove
      set = SkiplistSSet.new random: Random.new(1000)

      assert set.add(1);  assert_equal 1, set.length
      assert set.add(2);  assert_equal 2, set.length
      assert set.add(4);  assert_equal 3, set.length
      assert set.add(8);  assert_equal 4, set.length
      assert set.add(16); assert_equal 5, set.length
      assert set.add(32); assert_equal 6, set.length

      assert_equal 1, set.find(1)
      assert_equal 2, set.find(2)
      assert_equal 4, set.find(3)
      assert_equal 4, set.find(4)
      assert_equal 8, set.find(5)
      assert_equal 8, set.find(8)
      assert_equal 16, set.find(16)
      assert_equal 32, set.find(32)
      assert_nil set.find(33)

      assert set.remove(1);  assert_equal 5, set.length
      assert set.remove(2);  assert_equal 4, set.length
      assert !set.remove(3); assert_equal 4, set.length
      assert set.remove(4);  assert_equal 3, set.length
      assert !set.remove(5); assert_equal 3, set.length
      assert set.remove(8);  assert_equal 2, set.length
      assert set.remove(16); assert_equal 1, set.length
      assert set.remove(32); assert_equal 0, set.length
    end
  end
end
