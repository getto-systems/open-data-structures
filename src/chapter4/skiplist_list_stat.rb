require "chapter4/skiplist_list"

require_relative "stat"

module OpenDataStructures::Chapter4
  class SkiplistListStat < Stat
    def initialize
      super(SkiplistList){
        SkiplistList.new random: Random.new(1000)
      }
    end

    def dump(unit:, count:)
      dump_random(unit, count)
    end

    def dump_random(unit, count)
      start "random" do |instance,csv|
        count.times do |c|
          csv << rows_after(
            instance, c, unit,
            ->(i){ instance.push i },
            ->(i){ instance[i] }
          )
        end
        count.times do |c|
          csv << rows_before(
            instance, count - c - 1, unit,
            ->(i){ instance.pop },
            ->(i){ instance[i] }
          )
        end
      end
    end
  end

  SkiplistListStat.new.dump unit: 1000, count: 100
end
