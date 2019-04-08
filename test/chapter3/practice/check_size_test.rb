require "minitest/autorun"

require "chapter3/practice/check_size"

module OpenDataStructures::Chapter3
  module Practice
    class CheckSizeTest < Minitest::Test
      using CheckSize

      def test_sl_list
        list = SLList.new
        list.instance_variable_set(:@length, 1)
        assert_raises(CheckSize::LengthError){list.check_size!}
      end

      def test_dl_list
        list = DLList.new
        list.instance_variable_set(:@length, 1)
        assert_raises(CheckSize::LengthError){list.check_size!}
      end
    end
  end
end
