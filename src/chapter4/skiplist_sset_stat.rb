require "chapter4/skiplist_sset"

require_relative "stat"

module OpenDataStructures::Chapter4
  class SkiplistSSetStat < Stat
    def initialize
      super(SkiplistSSet){
        SkiplistSSet.new random: Random.new(1000)
      }

      @random = Random.new(2000)
    end

    def dump(unit:, count:)
      dump_random(unit, count)
    end

    def dump_random(unit, count)
      start "random" do |instance,csv|
        values = []
        count.times do |c|
          csv << rows_after(
            instance, c, unit,
            ->(i){ instance.add (values.push @random.rand(unit*count*100)).last },
            ->(i){ instance.find @random.rand(unit*count*100) }
          )
        end
        count.times do |c|
          csv << rows_before(
            instance, count - c - 1, unit,
            ->(i){ instance.remove values.pop },
            ->(i){ instance.find @random.rand(unit*count*100) }
          )
        end
      end
    end
  end

  SkiplistSSetStat.new.dump unit: 1000, count: 100
end
