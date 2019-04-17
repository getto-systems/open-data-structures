require "chapter3/dl_list"

module OpenDataStructures::Chapter3
  module Practice
    module Palindrome
      refine DLList do
        def palindrome?
          (length - 1).times do |i|
            return false if self[i] != self[length - i - 1]
          end
          true
        end
      end
    end
  end
end
