require 'rspec'
require './lib/trail'

RSpec.describe Trail do

  before do
    @trail = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@trail).to be_a(Trail)
    end
    it 'has attributes' do
      expect(@trail.name).to eq('Grand Wash')
      expect(@trail.length).to eq(2.2)
      expect(@trail.level).to eq(:easy)
    end
  end
end

# Use TDD to create Trail, Park, and Hiker that will respond to the interaction pattern below:

# pry(main)> require './lib/trail'
# #=> true

# pry(main)> require './lib/park'
# #=> true

# pry(main)> require './lib/hiker'
# #=> true

# pry(main)> trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
# #=> #<Trail:0x00007fdd67232750 @length="2.2 miles", @level=:easy, @name="Grand Wash">

# pry(main)> trail1.name
# #=> "Grand Wash"

# pry(main)> trail1.length
# #=> 2.2

# pry(main)> trail1.level
# #=> :easy

# pry(main)> trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
# #=> #<Trail:0x00007fdd66946060 @length="1.7 miles", @level=:moderate, @name="Cohab Canyon">

# pry(main)> park1 = Park.new('Capitol Reef')
# #=> #<Park:0x00007fdd66927f48 @name="Capitol Reef", @trails=[]>

# pry(main)> park1.name
# #=> "Capitol Reef"

# pry(main)> park1.trails
# #=> []

# pry(main)> park1.add_trail(trail1)

# pry(main)> park1.add_trail(trail2)

# pry(main)> park1.trails
# #=> [#<Trail:0x00007fdd67232750...>, #<Trail:0x00007fdd66946060...>]

# pry(main)> trail3 = Trail.new({name: 'Tower Bridge', length: '3.0 miles', level: :moderate})
# #=> #<Trail:0x00007fdd68019a30 @length="3.0 miles", @level=:moderate, @name="Tower Bridge">

# pry(main)> park2 = Park.new('Bryce Canyon')
# #=> #<Park:0x00007fdd672aa7f0 @name="Bryce Canyon", @trails=[]>

# pry(main)> park2.add_trail(trail3)

# pry(main)> hiker = Hiker.new('Dora', :moderate)
# #=> #<Hiker:0x00007fdd6806da40 @experience_level=:moderate, @name="Dora", @parks_visited=[], @snacks={}>

# pry(main)> hiker.name
# #=> "Dora"

# pry(main)> hiker.experience_level
# #=> :moderate

# pry(main)> hiker.snacks
# #=> {}

# pry(main)> hiker.pack('water', 1)

# pry(main)> hiker.pack('trail mix', 3)

# pry(main)> hiker.snacks
# #=> {"water"=>1, "trail mix"=>3}

# pry(main)> hiker.pack('water', 1)

# pry(main)> hiker.snacks
# #=> {"water"=>2, "trail mix"=>3}

# pry(main)> hiker.parks_visited
# #=> []

# pry(main)> hiker.visit(park1)

# pry(main)> hiker.visit(park2)

# pry(main)> hiker.parks_visited
# #=> [#<Park:0x00007fdd66927f48...>, #<Park:0x00007fdd672aa7f0...>]