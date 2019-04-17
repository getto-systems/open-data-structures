require "chapter3/practice/truncate"

module OpenDataStructures::Chapter3
  module Practice
    module MergeSort
      refine DLList.singleton_class do
        def merge(listA, listB)
          list = new

          while listA.length > 0 or listB.length > 0
            if listA.length == 0
              while listB.length > 0
                list.take_first! listB
              end
            elsif listB.length == 0
              while listA.length > 0
                list.take_first! listA
              end
            elsif
              if listA[0] < listB[0]
                list.take_first! listA
              else
                list.take_first! listB
              end
            end
          end

          list
        end
      end

      refine DLList do
        using Truncate

        def take_first!(target)
          return if target.length == 0

          target_loop = target.instance_variable_get(:@loop)
          target_first = target_loop.next
          target_first.remove!
          target.instance_variable_set(:@length, target.length - 1)

          @loop.insert_before target_first
          @length += 1

          nil
        end

        def sort!
          return if length < 2

          tail = truncate! (length/2)
          tail.sort!

          sort!

          list = self.class.merge self, tail
          @loop = list.instance_variable_get(:@loop)
          @length = list.length
        end
      end
    end
  end
end
