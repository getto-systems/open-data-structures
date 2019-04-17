require "minitest/autorun"

require "chapter3/practice/palindrome"

module OpenDataStructures::Chapter3
  module Practice
    class PalindromeTest < Minitest::Test
      using Palindrome

      def test_palindrome
        list = DLList.new
        list.push :a
        list.push :b
        list.push :c
        list.push :b
        list.push :a

        assert_equal true, list.palindrome?
      end

      def test_not_palindrome
        list = DLList.new
        list.push :a
        list.push :b
        list.push :c
        list.push :d
        list.push :e

        assert_equal false, list.palindrome?
      end
    end
  end
end
