require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

describe Player do
  let(:player) {Player.new('Zulma', 'x')}
  context '#initialize' do
    it 'creates new player instance name' do
      expect(player.name).to eql('Zulma')
    end
    it 'creates new player instance icon' do
      expect(player.icon).to eql('x')
    end
  end
end