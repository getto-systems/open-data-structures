require "chapter3/sl_list"
require "chapter3/dl_list"

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

      refine DLList do
        def reverse!
          node = @loop

          (length + 1).times do
            next_node = node.next
            previous_node = node.previous

            node.next = previous_node
            node.previous = next_node

            node = next_node
          end
        end
      end
    end
  end
end
