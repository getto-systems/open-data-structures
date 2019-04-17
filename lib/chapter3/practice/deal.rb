require "chapter3/dl_list"

module OpenDataStructures::Chapter3
  module Practice
    module Deal
      refine DLList do
        def deal!
          even = DLList.new
          return even if length == 0

          node = @loop.next

          even_loop = even.instance_variable_get(:@loop)
          even_node = even_loop

          even_count = 0

          is_even = false
          (length - 1).times do
            if is_even
              node.previous.next = node.next

              even_node.next = node
              node.previous = even_node

              even_node = node

              even_count += 1
            end

            is_even = !is_even
            node = node.next
          end

          even_node.next = even_loop

          even.instance_variable_set(:@length, even_count)
          @length -= even_count

          even
        end
      end
    end
  end
end
