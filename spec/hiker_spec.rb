require 'rspec'
require './lib/hiker'
require './lib/park'
require './lib/trail'

RSpec.describe Hiker do

  before do
    @trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    @trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    @trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
    @trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    @trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    @trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
    @park1 = Park.new('Capitol Reef')
    @park2 = Park.new('Bryce Canyon')
    @hiker = Hiker.new('Dora', :moderate)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@hiker).to be_a(Hiker)
    end
    it 'has attributes' do
      expect(@hiker.name).to eq('Dora')
      expect(@hiker.experience_level).to eq(:moderate)
      expect(@hiker.snacks).to eq({})
      expect(@hiker.parks_visited).to eq([])
    end
  end
  describe '#pack' do
    it 'adds snacks for the hiker' do
      @hiker.pack('water', 1)
      @hiker.pack('trail mix', 3)
      expect(@hiker.snacks).to eq({"water"=>1, "trail mix"=>3})
      @hiker.pack('water', 1)
      expect(@hiker.snacks).to eq({"water"=>2, "trail mix"=>3})
    end
  end
  describe '#parks_visited' do
    it 'lets the hiker visit parks' do
      @hiker.visit(@park1)
      @hiker.visit(@park2)
      expect(@hiker.parks_visited).to eq([@park1, @park2])
    end
  end
  describe '#possible_trails' do
    it 'returns and array of trails matching the hikers experience lvl for visited parks' do
      @park1.add_trail(@trail1)
      @park1.add_trail(@trail2)
      @park1.add_trail(@trail3)
      @park2.add_trail(@trail4)
      @park2.add_trail(@trail5)
      @park2.add_trail(@trail6)
      @hiker.visit(@park1)
      @hiker.visit(@park2)
      expect(@hiker.possible_trails).to eq([@trail2, @trail4, @trail6])
    end
  end
end
