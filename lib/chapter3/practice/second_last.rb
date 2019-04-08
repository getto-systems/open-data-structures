require "chapter3/sl_list"

module OpenDataStructures::Chapter3
  class SLList
    def second_last
      if @head
        previous = nil
        target = @head
        while target.next
          previous = target
          target = target.next
        end
        previous.value if previous
      end
    end
  end
end
