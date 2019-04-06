require "chapter2/backing_array"

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
end
