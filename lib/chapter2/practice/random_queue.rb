require "chapter2/backing_array"

module OpenDataStructures
  module Chapter2
    module Practice
      class RandomQueue
        def initialize(random)
          @random = random
          @length = 0
          @array = BackingArray.new(length: 1)
          @index = generate_index(@array.length)
        end

        attr_reader :length

        def blank
          @array.length - length
        end

        def [](index)
          assert_index index
          get index
        end

        def []=(index,value)
          assert_index index
          set index, value
        end

        def add(value)
          grow if full?

          set length, value
          @length += 1

          nil
        end

        def remove
          target = get(length - 1)

          set (length - 1), nil
          @length -= 1

          shrink if over?

          target
        end

        private

          def get(index)
            @array[@index[index]]
          end

          def set(index,value)
            @array[@index[index]] = value
          end

          def full?
            length + 1 >= @array.length
          end

          def over?
            length < @array.length / 3
          end

          def grow
            resize(@array.length * 2)
          end

          def shrink
            resize(@array.length / 3)
          end

          def resize(new_length)
            new_length = 1 if new_length <= 0
            new_array = BackingArray.new(length: new_length)
            new_index = generate_index(new_array.length)
            length.times do |i|
              new_array[new_index[i]] = get i
            end
            @array = new_array
            @index = new_index
          end

          def generate_index(length)
            new_index = BackingArray.new(length: length)
            length.times do |i|
              loop do
                index = @random.rand(length)
                if new_index[index].nil?
                  new_index[index] = i
                  break
                end
              end
            end
            new_index
          end

          def assert_index(index)
            raise ArgumentError, "index: #{index} / length: #{length}" if index < 0 or index >= length
          end
          def assert_add(index)
            raise ArgumentError, "index: #{index} / length: #{length}" if index < 0 or index >= length + 1
          end
      end
    end
  end
end
