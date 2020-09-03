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
  let(:board_matrix) {[
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' ']
  ]}

  
  context '#check_coord' do
    it 'returns true if coord is valid or unoccupied' do
      expect(board.check_coord(lin, col)).to eql(true)
    end
    
    it 'returns false if coord is invalid or occupied' do
      expect(board.check_coord(w_lin, w_col)).to eql(false)
    end
  end

  context '#restart' do
    it 'returns an empty board' do
      expect(board.restart).to eql(board_matrix)
    end
  end

  context 'initialize' do
    it 'returns board' do
      expect(board.board).to eql(board_matrix)
    end
    it 'returns player info' do
      expect(board.player1).to eql(player1)
    end
  end 
  context '#wincheck' do
    it 'returns false if no icon match in a line' do
      board.instance_variable_set('@board', [['x', 'o', 'x'], ['o', 'o', 'x'], ['x', 'x', 'o']])
      expect(board.wincheck(1, col.to_i)).to eql(false)
    end

    it 'returns true if icons match in a line' do
      board.instance_variable_set('@board', [['x', 'o', 'x'], ['o', 'o', 'x'], ['x', 'o', 'o']])
      expect(board.wincheck(1, col.to_i)).to eql(true)
    end
  end
end
