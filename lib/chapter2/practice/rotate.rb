require "chapter2/backing_array"
require "chapter2/array_stack"
require "chapter2/array_queue"
require "chapter2/array_deque"
require "chapter2/dual_array_deque"
require "chapter2/rootish_array_stack"
require "chapter2/practice/treque"

module OpenDataStructures::Chapter2
  module Practice
    module Rotate
      refine BackingArray do
        def rotate(amount)
          new_array = BackingArray.new(length: length)
          length.times do |i|
            new_array[(i + amount) % length] = self[i]
          end
          new_array
        end
      end

      refine ArrayStack do
        def rotate!(amount)
          new_array = BackingArray.new(length: length)
          length.times do |i|
            new_array[i] = get i
          end
          @array = new_array.rotate(amount)
        end
      end

      refine ArrayQueue do
        def rotate!(amount)
          new_array = BackingArray.new(length: length)
          length.times do |i|
            new_array[i] = get i
          end
          @array = new_array
          @index = amount - 1
        end
      end

      refine ArrayDeque do
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

      refine DualArrayDeque do
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

      refine RootishArrayStack do
        def rotate!(amount)
          amount.times do
            unshift(pop) # TODO 思いつかない
          end
        end
      end

      refine Treque do
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
end
