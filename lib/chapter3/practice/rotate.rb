require "chapter3/dl_list"

module OpenDataStructures::Chapter3
  module Practice
    module Rotate
      refine DLList do
        def rotate!(count)
          node = @loop

          if count > length/2
            (length - count + 1).times do
              node = node.next
            end
          else
            count.times do
              node = node.previous
            end
          end

          @loop.remove!
          @loop = node.insert_before @loop
        end
      end
    end
  end
end
