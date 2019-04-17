require "chapter3/dl_list"

module OpenDataStructures::Chapter3
  module Practice
    module Absorb
      refine DLList do
        def absorb!(target)
          return if target.length == 0

          target_loop = target.instance_variable_get(:@loop)

          @loop.previous.next = target_loop.next
          target_loop.previous.next = @loop

          @loop.previous = target_loop.previous

          target_loop.next = target_loop
          target_loop.previous = target_loop

          @length += target.length
          target.instance_variable_set(:@length, 0)

          nil
        end
      end
    end
  end
end
