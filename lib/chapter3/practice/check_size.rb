require "chapter3/sl_list"
require "chapter3/dl_list"

module OpenDataStructures::Chapter3
  module Practice
    module CheckSize
      class LengthError < RuntimeError; end

      def check_size!
        node = @head
        count = 0
        while node
          node = node.next
          count += 1
        end
        if count != length
          raise LengthError
        end
      end

      refine SLList do
        include CheckSize
      end

      refine DLList do
        include CheckSize
      end
    end
  end
end
