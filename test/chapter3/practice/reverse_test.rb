require "minitest/autorun"

require "chapter3/practice/reverse"

module OpenDataStructures::Chapter3
  module Practice
    class ReverseTest < Minitest::Test
      using Reverse

      def test_reverse_sl_list
        list = SLList.new
        list.push :a
        list.push :b
        list.push :c
        list.push :d

        list.reverse!

        assert_equal [:d,:c,:b,:a],
          [
            list[0],
            list[1],
            list[2],
            list[3],
          ]
      end

      def test_reverse_sl_list_recursive
        list = SLList.new
        list.push :a
        list.push :b
        list.push :c
        list.push :d

        list.reverse_recursive!

        assert_equal [:d,:c,:b,:a],
          [
            list[0],
            list[1],
            list[2],
            list[3],
          ]

=begin
        # 末尾再帰最適化
        RubyVM::InstructionSequence.compile_option = {tailcall_optimization: true, trace_instruction: false}
        RubyVM::InstructionSequence.new(File.read "/path/to/lib/chapter3/practice/reverse.rb").eval

        list = SLList.new
        10_000.times do |i|
          list.push i
        end
        list.reverse_recursive!
=end
      end

      def test_reverse_dl_list
        list = DLList.new
        list.push :a
        list.push :b
        list.push :c
        list.push :d

        list.reverse!

        assert_equal [:d,:c,:b,:a],
          [
            list[0],
            list[1],
            list[2],
            list[3],
          ]
      end
    end
  end
end
