require "chapter3/sl_list"

require_relative "stat"

module OpenDataStructures::Chapter3
  class SLListStat < Stat
    def initialize
      super(SLList)
    end

    def dump(unit:, count:)
      dump_first(unit, count)
      dump_last(unit, count)
      dump_middle(unit, count)
    end

    def dump_first(unit, count)
      start "first" do |instance,csv|
        count.times do |c|
          csv << rows_after(
            instance, c, unit,
            ->(i){ instance.unshift i },
            ->(i){ instance[0] }
          )
        end
        count.times do |c|
          csv << rows_before(
            instance, count - c - 1, unit,
            ->(i){ instance.shift },
            ->(i){ instance[0] }
          )
        end
      end
    end

    def dump_last(unit, count)
      start "last" do |instance,csv|
        count.times do |c|
          csv << rows_after(
            instance, c, unit,
            ->(i){ instance.unshift i },
            ->(i){ instance[instance.length - 1] }
          )
        end
        count.times do |c|
          csv << rows_before(
            instance, count - c, unit,
            ->(i){ instance.shift },
            ->(i){ instance[instance.length - 1] }
          )
        end
      end
    end

    def dump_middle(unit, count)
      start "middle" do |instance,csv|
        count.times do |c|
          csv << rows_after(
            instance, c, unit,
            ->(i){ instance.unshift i },
            ->(i){ instance[instance.length/2] }
          )
        end
        count.times do |c|
          csv << rows_before(
            instance, count - c, unit,
            ->(i){ instance.shift },
            ->(i){ instance[instance.length/2] }
          )
        end
      end
    end
  end

  SLListStat.new.dump unit: 100, count: 100
end
