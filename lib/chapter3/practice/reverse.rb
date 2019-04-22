require "chapter3/sl_list"
require "chapter3/dl_list"

module OpenDataStructures::Chapter3
  module Practice
    module Reverse
      refine SLList do
        def reverse!
          node = @head
          previous = nil

          while node
            next_node = node.next

            target = node
            target.next = previous

            node = next_node
            previous = target
          end

          @head = previous
        end

        def reverse_recursive!
          @head = reverse_recursive_helper(@head)
        end

        private

          def reverse_recursive_helper(node,previous=nil)
            return previous unless node

            next_node = node.next

            target = node
            target.next = previous

            reverse_recursive_helper(next_node, target)
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
