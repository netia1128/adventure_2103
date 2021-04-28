class Trail
  attr_reader :name,
              :length,
              :level

  def initialize(attributes)
    @name = attributes[:name]
    @length = attributes[:length].split().first.to_f
    @level = attributes[:level]
  end
end