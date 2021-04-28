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


