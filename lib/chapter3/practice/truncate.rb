require "chapter3/dl_list"

module OpenDataStructures::Chapter3
  module Practice
    module Truncate
      refine DLList do
        def truncate!(index)
          validate_add index

          overflow = DLList.new
          return overflow if index == length

          node = @loop

          if index > length/2
            (length - index).times do
              node = node.previous
            end
          else
            (index + 1).times do
              node = node.next
            end
          end

          overflow_loop = overflow.instance_variable_get(:@loop)
          overflow_loop.next = node
          overflow_loop.previous = @loop.previous

          node.previous.next = @loop
          @loop.previous = node.previous

          overflow.instance_variable_set(:@length, length - index)
          @length = index

          overflow
        end
      end
    end
  end
end
