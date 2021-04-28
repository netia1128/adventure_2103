require 'rspec'
require './lib/park'
require './lib/trail'

RSpec.describe Park do

  before do
    @trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    @trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    @trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
    @trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    @trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    @trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
    @park1 = Park.new('Capitol Reef')
    @park2 = Park.new('Bryce Canyon')
    @hiker1 = Hiker.new('Dora', :moderate)
    @hiker2 = Hiker.new('Frank', :easy)
    @hiker3 = Hiker.new('Jack', :strenuous)
    @hiker4 = Hiker.new('Sally', :strenuous)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@park1).to be_a(Park)
    end
    it 'has attributes' do
      expect(@park1.name).to eq('Capitol Reef')
      expect(@park1.trails).to eq([])
    end
  end
  describe '#add_trail' do
    it 'allows you to add trails' do
      @park1.add_trail(@trail1)
      @park1.add_trail(@trail2)
      expect(@park1.trails).to eq([@trail1, @trail2])
    end
  end
  describe '#trails_shorter_than' do
    it 'returns trails shorter than a specified value' do
      @park1.add_trail(@trail1)
      @park1.add_trail(@trail2)
      @park1.add_trail(@trail3)
      @park2.add_trail(@trail4)
      @park2.add_trail(@trail5)
      @park2.add_trail(@trail6)
      expect(@park1.trails_shorter_than(2.5)).to eq([@trail1, @trail2])
      expect(@park2.trails_shorter_than(2.5)).to eq([])
    end
  end
  describe '#hikeable_miles' do
    it 'returns the total hikeable miles in a park' do
      @park1.add_trail(@trail1)
      @park1.add_trail(@trail2)
      @park1.add_trail(@trail3)
      @park2.add_trail(@trail4)
      @park2.add_trail(@trail5)
      @park2.add_trail(@trail6)
      expect(@park1.hikeable_miles).to eq(7.5)
      expect(@park2.hikeable_miles).to eq(16.9)
    end
  end
  describe '#trails_by_level' do
    it 'returns a hash of trails by level' do
      @park1.add_trail(@trail1)
      @park1.add_trail(@trail2)
      @park1.add_trail(@trail3)
      @park2.add_trail(@trail4)
      @park2.add_trail(@trail5)
      @park2.add_trail(@trail6)
      park1_trails_by_level = {
                                :easy => ['Grand Wash'],
                                :moderate => ['Cohab Canyon'],
                                :strenuous => ["Chimney Rock Loop"]
                              }
      park2_trails_by_level = {
                                :easy => ["Rim Trail"],
                                :moderate => ["Queen's/Navajo Loop", "Tower Bridge"]
                              }

      expect(@park1.trails_by_level).to eq(park1_trails_by_level)
      expect(@park2.trails_by_level).to eq(park2_trails_by_level)
    end
  end
  describe '#visitors_log' do
    it 'returns a hash detailing the visitor logs' do
      #will clean up hooking later, time allowing
      trail1 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
      trail2 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
      trail3 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
      trail4 = Trail.new({name: 'Peekaboo Loop', length: '5.5 miles', level: :strenuous})
      @park2.add_trail(trail1)
      @park2.add_trail(trail2)
      @park2.add_trail(trail3)
      @park2.add_trail(trail4)
      #STUBS ARE THE BANE OF MY EXISTENCE!!!!!!!
      # allow(@hiker1).to receive(:visit).with(@park2, 'dogs')
      @hiker1.visit(@park2, '19800623')
      @hiker2.visit(@park2, '19800624')
      @hiker3.visit(@park2, '19800624')
      @hiker4.visit(@park2, '19800625')
      @hiker1.visit(@park2, '20200623')
      @hiker2.visit(@park2, '20200624')
      @hiker3.visit(@park2, '20200624')
      @hiker4.visit(@park2, '20200625')
      expect(@park2.visitors_log).to be_a(Hash)
    end
  end
end