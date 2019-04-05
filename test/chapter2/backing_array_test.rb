require "minitest/autorun"

require "chapter2/backing_array"

module OpenDataStructures::Chapter2
  class BackingArrayTest < Minitest::Test
    def test_set_to_index
      array = BackingArray.new(length: 3)

      array[0] = :a
      array[1] = :b

      assert_equal :a, array[0]
      assert_equal :b, array[1]
      assert_nil array[2]

      array[1] = :c
      assert_equal :c, array[1]
    end

    def test_access_to_out_of_range
      array = BackingArray.new(length: 3)

      assert_raises{ array[3] }
      assert_raises{ array[3] = :b }
    end
  end
end
