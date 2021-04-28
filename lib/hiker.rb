require 'time'

class Hiker
  attr_reader :name,
              :experience_level,
              :snacks,
              :parks_visited

  def initialize(name, experience_level)
    @name = name
    @experience_level = experience_level
    @snacks = Hash.new(0)
    @parks_visited = []
  end

  def pack(snack, quantity)
    @snacks[snack] += quantity
  end

  def visit(park, date = Date.today.strftime('%d%m%y'))
    @parks_visited << park
    park.mark_vistor_log(self, date)
  end

  def possible_trails
    @parks_visited.flat_map do |park|
      park.trails.find_all do |trail|
        trail.level == @experience_level
      end
    end
  end

  def favorite_snack
    favorite_snack = @snacks.max_by do |snack, quantity|
      quantity
    end
    favorite_snack.first
  end
end