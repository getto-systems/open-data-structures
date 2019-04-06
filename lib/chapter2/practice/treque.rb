require "chapter2/array_deque"

module OpenDataStructures
  module Chapter2
    class Treque
      def initialize
        @front = ArrayDeque.new
        @back = ArrayDeque.new
      end

      def length
        @front.length + @back.length
      end

      def blank
        @front.blank + @back.blank
      end

      def [](index)
        if index < @front.length
          @front[@front.length - index - 1]
        else
          @back[index - @front.length]
        end
      end

      def []=(index,value)
        if index < @front.length
          @front[@front.length - index - 1] = value
        else
          @back[index - @front.length] = value
        end
      end

      def add(index,value)
        if index < @front.length
          @front.add (@front.length - index), value
        else
          @back.add (index - @front.length), value
        end
      ensure
        balance
      end

      def remove(index)
        if index < @front.length
          @front.remove(@front.length - index - 1)
        else
          @back.remove(index - @front.length)
        end
      ensure
        balance
      end

      def push(value)
        add(length,value)
      end

      def unshift(value)
        add(0,value)
      end

      def pop
        remove(length - 1)
      end

      def shift
        remove(0)
      end

      private

        def balance
          if (@front.length * 3 < @back.length) or (@front.length > @back.length * 3)
            new_front = ArrayDeque.new
            new_back = ArrayDeque.new

            half = length / 2

            length.times do |i|
              if i < half
                new_front.push self[half - i - 1]
              else
                new_back.push self[i]
              end
            end

            @front = new_front
            @back = new_back
          end
        end
    end
  end
end
