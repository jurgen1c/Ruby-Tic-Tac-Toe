require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

describe Board do
  player1 = Player.new('Zulma', 'x')
  player2 = Player.new('JCG', 'o')
  board = Board.new(player1, player2)
  let(:lin) { 'a' }
  let(:col) { '1' }
  let(:w_lin) { 'z' }
  let(:w_col) { '9' }

  describe '#wincheck' do
    it 'returns if the player has completed a line' do
      expect(board.wincheck(1, col)).to eql(true)
    end
  end

  describe '#check_coord' do
    it 'returns true if coord is valid or unoccupied' do
      expect(board.check_coord(lin, col)).to eql(true)
    end

    it 'returns flse if coord is invalid or occupied' do
      expect(board.check_coord(w_lin, w_col)).to eql(false)
    end
  end

  describe '#restart' do
    it 'returns an empty board' do
      expect(board.restart).to include(board)
    end
  end
end