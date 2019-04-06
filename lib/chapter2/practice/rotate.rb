require "chapter2/backing_array"
require "chapter2/array_stack"
require "chapter2/array_queue"
require "chapter2/array_deque"
require "chapter2/dual_array_deque"
require "chapter2/rootish_array_stack"
require "chapter2/practice/treque"

module OpenDataStructures::Chapter2
  class BackingArray
    def rotate(amount)
      new_array = BackingArray.new(length: length)
      length.times do |i|
        new_array[(i + amount) % length] = self[i]
      end
      new_array
    end
  end

  class ArrayStack
    def rotate!(amount)
      new_array = BackingArray.new(length: length)
      length.times do |i|
        new_array[i] = get i
      end
      @array = new_array.rotate(amount)
    end
  end

  class ArrayQueue
    def rotate!(amount)
      new_array = BackingArray.new(length: length)
      length.times do |i|
        new_array[i] = get i
      end
      @array = new_array
      @index = amount - 1
    end
  end

  class ArrayDeque
    def rotate!(amount)
      if amount < length / 2
        amount.times do
          unshift(pop)
        end
      else
        (length - amount).times do
          push(shift)
        end
      end
    end
  end

  class DualArrayDeque
    def rotate!(amount)
      if amount < length / 2
        amount.times do
          unshift(pop)
        end
      else
        (length - amount).times do
          push(shift)
        end
      end
    end
  end

  class RootishArrayStack
    def rotate!(amount)
      amount.times do
        unshift(pop) # TODO 思いつかない
      end
    end
  end

  module Practice
    class Treque
      def rotate!(amount)
        if amount < length / 2
          amount.times do
            unshift(pop)
          end
        else
          (length - amount).times do
            push(shift)
          end
        end
      end
    end
  end
end
