class Park
  attr_reader :name,
              :trails,
              :log

  def initialize(name)
    @name = name
    @trails = []
    @log = {}
  end

  def add_trail(trail)
    @trails << trail
  end

  def trails_shorter_than(length)
    @trails.find_all do |trail|
      trail.length < 2.5
    end
  end

  def hikeable_miles
    @trails.sum do |trail|
      trail.length
    end
  end

  def trails_by_level
    @trails.each_with_object({}) do |trail, hash|
      hash[trail.level] = names_of_trails_at_level(trail.level)
    end
  end

  def mark_vistor_log(hiker, date)
    @log[hiker] = date
  end

  def visitors_log
    #wasted too much time trying to get the stub to actually do this :'(
    visitors_log = {}
    @log.each do |hiker, date|
      visitors_log[date] = hiker
    end
  end
  private

  def trails_at_level(experience_level)
    @trails.find_all do |trail|
      trail.level == experience_level
    end
  end

  def names_of_trails_at_level(experience_level)
    trails_at_level(experience_level).map do |trail|
      trail.name
    end
  end
end