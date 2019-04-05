require "chapter2/backing_array"

module OpenDataStructures::Chapter2
  class << self
    def assert(message)
      raise "FAILED: #{message}" unless yield
    end

    def expect_raise(exception)
      begin
        yield
        raise "FAILED: #{exception.class} is not raised"
      rescue exception => e
      end
    end
  end

  array = BackingArray.new(length: 3)

  array[0] = :a
  array[1] = :b

  assert("array[0] == :a"){ array[0] == :a }
  assert("array[1] == :b"){ array[1] == :b }
  assert("array[2] == nil"){ array[2].nil? }

  array[1] = :c

  assert("array[1] == :c"){ array[1] == :c }

  expect_raise(ArgumentError){ array[3] }
  expect_raise(ArgumentError){ array[3] = :b }
end
