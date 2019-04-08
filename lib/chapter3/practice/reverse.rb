require "chapter3/sl_list"

module OpenDataStructures::Chapter3
  module Practice
    module Reverse
      refine SLList do
        def reverse!
          target = node = @head
          previous = nil

          while node
            target = node
            node = node.next

            target.next = previous
            previous = target
          end

          @head = target
        end
      end
    end
  end
end
